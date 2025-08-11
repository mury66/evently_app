import 'package:evently_app/screens/updateEvent/UpdateEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/taskModel.dart';
import '../providers/fireStoreProvider.dart';
import '../providers/themeProvider.dart';

class Taskitem extends StatelessWidget {
  final TaskModel task;
  const Taskitem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final fireStoreProvider = Provider.of<FireStoreProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
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
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InkWell(
                  onTap: ()
                    {
                      Navigator.pushNamed(context,UpdateEvent.routeName,arguments: task);
                    },
                    child: buildImage(task.category, context, isDark)),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 8.h,
                    left: 8.w,
                    right: 8.w,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r),
                    ),
                    color: Theme.of(
                      context,
                    ).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 250.w,
                        height: double.infinity,
                        child: Text(
                          task.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          fireStoreProvider.toggleIsFav(
                            task.id,
                            task.isFav,
                            context,
                          );
                        },
                        icon: Icon(task.isFav? Icons.favorite:Icons.favorite_border ,
                            size: 24.r,
                            color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: 43.w,
              height: 49.w,
              margin: EdgeInsets.only(top: 8.h, left: 8.w),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                task.dayAndMonth,
                textAlign: TextAlign.center,
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                style: Theme.of(context).textTheme.displayMedium
                    ?.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildImage(String ImgPath,context,bool isDark)
  {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(isDark?"assets/images/${ImgPath}Dark.png":"assets/images/${ImgPath}.png", width: double.infinity, height: double.infinity, fit: BoxFit.cover));
  }
}
