import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:evently_app/screens/createEvent/createEventScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../casheHelper/sharedPreferences.dart';
import '../providers/categoriesProvider.dart';
import '../providers/tabsProvider.dart';
import '../providers/themeProvider.dart';
import '../widgets/categoryListItem.dart';
import 'homeTabs/favTab.dart';
import 'homeTabs/homeTab.dart';
import 'homeTabs/mapTab.dart';
import 'homeTabs/profileTab.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  int selectedCategoryIndex = 0;
  List<String> categories = [
    'all',
    'sport',
    'workshop',
    'birthday',
    'book club',
    'eating',
    'exhibition',
    'gaming',
    'holiday',
  ];
  Map<String, IconData> categoryIcons = {
    'all': Icons.apps,
    'sport': Icons.sports_soccer, // أو sports_basketball / sports_gymnastics
    'workshop': Icons.handyman,
    'birthday': Icons.cake,
    'book club': Icons.menu_book,
    'eating': Icons.restaurant,
    'exhibition': Icons.museum, // أو imagesearch_roller
    'gaming': Icons.sports_esports,
    'holiday': Icons.beach_access, // أو flight / travel_explore
  };

  HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    var tabProvider = Provider.of<TabsProvider>(context);
    final categoryProvider = Provider.of<CategoriesProvider>(context);

    var themeProvider = Provider.of<ThemeProvider>(context);
    List<Widget> tabs = [
      const HomeTab(),
      const MapTab(),
      const FavTab(),
      const ProfileTab(),
    ];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(174.h),
        child: Directionality(
          textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr  ,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 174.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 56.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("welcome_back".tr(), style: context.bodySmall),
                        Text("Amer Medhat Ahmed", style: Theme.of(context).textTheme.headlineLarge),
                        SizedBox(height: 4.h),
                        Directionality(
                          textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: Colors.white, size: 16.r),
                              SizedBox(width: 4.w),
                              Text("location".tr(), style: context.bodyMedium),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(
                          height: 44.h,
                          child:
                          ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            separatorBuilder: (context, index) => SizedBox(width: 8.w),
                            itemBuilder: (context, index) => InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                categoryProvider.setSelectedIndex(index);
                              },

                              child: CategorylistItem(categoryName: categories[index].tr(),
                                categoryIcon: categoryIcons[categories[index]]?? Icons.category,
                                isSelected: categoryProvider.selectedIndex == index,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actionsPadding: EdgeInsets.symmetric(horizontal: 16),
                actions: [
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) => RotationTransition(
                          turns: animation,
                          child: child,
                        ),
                        child: ImageIcon(
                            (AssetImage(!themeProvider.isDarkMode?"assets/icons/night_mode.png":"assets/icons/light_mode.png" ))
                            , color:Theme.of(context).highlightColor, size: 35.r)),
                    onPressed: () {
                      themeProvider.switchThemeMode();
                    },
                  ),
                  SizedBox(
                    width: 35.w,
                    height: 35.h,
                    child:
                    ElevatedButton(
                      onPressed: () {
                        final newLocale = isArabic ? Locale("en") : Locale("ar");
                        context.setLocale(newLocale);
                        SharedPreferencesHelper.setLanguage(newLocale.languageCode);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Color(0xffF4EBDC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(scale: animation, child: child),
                        child: Text(
                          isArabic ? "EN" : "ع",
                          key: ValueKey<String>(isArabic ? "EN" : "ع"),
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                              color: Theme.of(context).splashColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  )
                ],
              ),
            ],
          )
          ,
        ),
      ) ,
      bottomNavigationBar: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: BottomAppBar(
          notchMargin: 10.r,
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              buildNavItem("home",context,0,tabProvider),
              SizedBox(width: 60.w,),
              buildNavItem("map",context,1,tabProvider),
              Spacer(),
              buildNavItem("fav",context,2,tabProvider),
              SizedBox(width: 60.w,),
              buildNavItem("profile",context,3,tabProvider),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 56.w,
        height: 56.h,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateEvent.routeName);
          },
          tooltip: 'Add',
          splashColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Theme.of(context).splashColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          child:Icon(Icons.add,color: Colors.white,size: 30.r,),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: tabs[tabProvider.currentIndex]),


    );
  }

  Widget buildNavItem(String label, context,int index,TabsProvider tabProvider) {
    return InkWell(
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8.r),
      splashFactory: InkRipple.splashFactory,
      splashColor: Colors.transparent,
      onTap: () {
        tabProvider.setCurrentIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(tabProvider.currentIndex == index ? "assets/icons/${label}filled.png" : "assets/icons/$label.png" ),
            color: Theme.of(context).highlightColor,
            size: 24.r,
          ),
          Text(
            label.tr(),
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
        ],
      ),
    );
  }
}
