import 'package:evently_app/providers/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 203.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 1.w,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    buildImage("sport", context, isDark),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "This is the match day",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("assets/icons/fav.png"), size: 24.r, color: Theme.of(context).colorScheme.primary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.h, left: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),

                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("21",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),
                    Text("NOV",style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),

                  ],
                ),
                ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      itemCount: 10,
    );
  }
  Widget buildImage(String ImgPath,context,bool isDark)
  {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(isDark?"assets/images/${ImgPath}Dark.png":"assets/images/${ImgPath}.png", width: double.infinity, height: double.infinity, fit: BoxFit.cover));
  }
}
