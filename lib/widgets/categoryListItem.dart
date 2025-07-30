import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorylistItem extends StatelessWidget {
  String categoryName;
  IconData categoryIcon;

  CategorylistItem({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46.r),
        border: Border.all(color: Theme.of(context).highlightColor, width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(categoryIcon, color: Theme.of(context).highlightColor),
          SizedBox(width: 5),
          Text(categoryName, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
