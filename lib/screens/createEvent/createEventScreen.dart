import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/extensions/BuildContextExt.dart';
import 'package:evently_app/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/taskModel.dart';
import '../../providers/categoriesProvider.dart';
import '../../providers/fitrstoreProvider.dart';
import '../../widgets/categoryListItem.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = '/createEvent';
  CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  int selectedCategoryIndex = 0;

  List<String> categories = [
    'sport',
    'workShop',
    'birthday',
    'bookClub',
    'eating',
    'exhibition',
    'gaming',
    'holiday',
  ];

  Map<String, IconData> categoryIcons = {
    'sport': Icons.sports_soccer, // أو sports_basketball / sports_gymnastics
    'workshop': Icons.handyman,
    'birthday': Icons.cake,
    'book club': Icons.menu_book,
    'eating': Icons.restaurant,
    'exhibition': Icons.museum, // أو imagesearch_roller
    'gaming': Icons.sports_esports,
    'holiday': Icons.beach_access, // أو flight / travel_explore
  };

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickDate() async {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? ColorScheme.dark(
              primary: Theme.of(context).primaryColor,
              onPrimary: Theme.of(context).scaffoldBackgroundColor,
              onSurface: Theme.of(context).highlightColor,
            )
                : ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: isDark ? Colors.teal : Colors.deepPurple,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
        print("_selectedDate: $_selectedDate");
      });
    }
  }


  Future<void> _pickTime() async {
    final isDark = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: isDark
                ? ColorScheme.dark(
              primary: Theme.of(context).primaryColor,
              onPrimary: Theme.of(context).scaffoldBackgroundColor,
              onSurface: Theme.of(context).highlightColor,
            )
                : ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: isDark ? Theme.of(context).scaffoldBackgroundColor: Colors.deepPurple,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      setState(() {
        _selectedTime = time;
        print("_selectedTime: $_selectedTime");
      });
    }
  }


  String _formatDate(DateTime? date) {
    if (date == null) return "choose_date".tr();
    return "${date.day}/${date.month}/${date.year}";
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return "choose_time".tr();

    final int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final String period = time.period == DayPeriod.am ? "AM" : "PM";
    final String minute = time.minute.toString().padLeft(2, '0');

    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final categoryProvider = Provider.of<CategoriesProvider>(context);
    final tasksProvider = Provider.of<FireStoreProvider>(context);
    final isArabic = context.locale.countryCode=="ar";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Directionality(
          textDirection: ui.TextDirection.ltr,
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_outlined, color: Theme.of(context).primaryColor)),
            title: Text('Create Event',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).primaryColor
            ),),
          ),
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              buildImage(categories[categoryProvider.selectedIndex],context,isDark),
          SizedBox(
            height: 40.h,
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
                  eventsScreen: true,
                ),
              ),
            ),),
                Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("title".tr(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary
                      )),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'title is required';
                          }
                          return null;
                        },
                        controller: _titleController,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: !isDark? Color(0xff7B7B7B) : null
                        ),
                        decoration: InputDecoration(
                          prefixIcon: ImageIcon(AssetImage("assets/icons/title.png"))
                        ),
                      ),
                    ],
                  ),
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("description".tr(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary
                    )),
                    TextFormField(
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'description is required';
                        }
                        return null;
                      },
                      controller: _descriptionController,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: !isDark? Color(0xff7B7B7B) : null
                      ),
                      decoration: InputDecoration(
                        hintText: "description".tr(),
                        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: !isDark? Color(0xff7B7B7B) : null
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 18.h),
                      ),
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageIcon(
                      AssetImage("assets/icons/date_ic.png")
                      , color: Theme.of(context).colorScheme.onSecondary, size: 24),
                      SizedBox(width: 8.w),
                      Text("Event Date".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary
                      )),
                    ],
                  ),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text(_formatDate(_selectedDate),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageIcon(
                          AssetImage("assets/icons/date_ic.png")
                          , color: Theme.of(context).colorScheme.onSecondary, size: 24),
                      SizedBox(width: 8.w),
                      Text("Event Date".tr(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary
                      )),
                    ],
                  ),
                  TextButton(
                    onPressed: _pickTime,
                    child: Text(_formatTime(_selectedTime),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary
                    )),
                  )
                ],
              ),
              Spacer(),
              SafeArea(
                child: ElevatedButton(
                    onPressed: (){
                  if (formKey.currentState!.validate()) {
                    final task = TaskModel(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      category: categories[categoryProvider.selectedIndex],
                      date: _selectedDate?.millisecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
                      time: _selectedTime != null
                    ? _selectedTime!.hour * 3600 + _selectedTime!.minute * 60
                        : DateTime.now().hour * 3600 + DateTime.now().minute * 60,
                    );
                    tasksProvider.createTask(task,context);
                  }
                }, style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                    child: Text("Create Event".tr(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),



            ],
          ),
        ),
      )
    );
  }

  Widget buildImage(String ImgPath,context,bool isDark)
  {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(isDark?"assets/images/${ImgPath}Dark.png":"assets/images/${ImgPath}.png", width: double.infinity, height: 200, fit: BoxFit.cover));
  }
}
