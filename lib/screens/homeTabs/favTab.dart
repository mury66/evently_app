import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/themeProvider.dart';
import 'package:evently_app/widgets/taskItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../models/taskModel.dart';
import '../../providers/fireStoreProvider.dart';

class FavTab extends StatelessWidget {
  String category;
  FavTab({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final fireStoreProvider = Provider.of<FireStoreProvider>(context);
    return StreamBuilder<List<TaskModel>>(
      stream: fireStoreProvider.getFavTasksStream(category), // Simulating
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }
        else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "No events found".tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        }
        else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Taskitem(task: snapshot.data![index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: snapshot.data!.length,
            ),
          );
        }
      },
    );
  }

  Widget buildImage(String ImgPath, context, bool isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        isDark
            ? "assets/images/${ImgPath}Dark.png"
            : "assets/images/${ImgPath}.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

}
