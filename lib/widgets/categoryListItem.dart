import 'package:evently_app/providers/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategorylistItem extends StatelessWidget {
  String categoryName;
  IconData categoryIcon;
  bool isSelected ;
  bool eventsScreen;
  CategorylistItem({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.isSelected,
    this.eventsScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark= Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: !eventsScreen ?
        isSelected
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : Colors.transparent :
        isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent

        ,
        borderRadius: BorderRadius.circular(46.r),
        border: Border.all(color:!eventsScreen ? Theme.of(context).colorScheme.onPrimaryContainer:Theme.of(context).colorScheme.primary, width: 1.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        Icon(
        categoryIcon,
      size: 24.w,
        color:
      !eventsScreen
            ? isSelected
            ? Theme.of(context).colorScheme.tertiary
            : Theme.of(context).highlightColor
            :
        isSelected
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
      ),
          SizedBox(width: 5.w),
          Text(
            categoryName,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
              !eventsScreen
                  ? isSelected
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).highlightColor
                  :
              isSelected
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
