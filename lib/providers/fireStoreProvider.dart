import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/taskModel.dart';
import '../models/userModel.dart';
import '../widgets/snackBar.dart';

class FireStoreProvider extends ChangeNotifier {

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (UserModel task, _) {
        return task.toJson();
      },
    );
  }

  createUser(UserModel user) async {
    try {
      var doc = getUsersCollection().doc(user.id);
      await doc.set(user);
      print("User created successfully with ID: ${user.id}");
      notifyListeners();
    } catch (e) {
      print("Error creating user: $e");
    }
  }

  static Future<UserModel?> getUserById() async {
    try {
      final docSnapshot = await getUsersCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();
      if (docSnapshot.exists) {
        print("ddddddeeeeebbbbbug${docSnapshot.data()}");
        return docSnapshot.data();
      } else {
        print("User with ID ${FirebaseAuth.instance.currentUser!.uid} does not exist.");
        return null;
      }
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }

  CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data()!;
            return TaskModel.fromJson(data);
          },
          toFirestore: (TaskModel task, _) {

            return task.toJson();
          },
        );
  }

  createTask(TaskModel task, context) async {
    try {
      var doc = getTasksCollection().doc();
      task.id = doc.id;
      await doc.set(task);
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              "task_created".tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to create task: $e"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  updateTask(TaskModel task, context) async {
    try {
      await getTasksCollection().doc(task.id).update(task.toJson());
      notifyListeners();
      showAppSnackBar(context, "task_updated".tr());
      Navigator.pop(context);
    } catch (e) {
      showAppSnackBar(context, "Failed_to_update_task! $e".tr(), backgroundColor: Colors.redAccent);
    }
  }

  toggleIsFav(String taskId, bool isFav, context) async {
    try {
      final docSnapshot = await getTasksCollection().doc(taskId).get();
      if (docSnapshot.exists) {
        final task = docSnapshot.data();
        if (task != null) {
          final newValue = !task.isFav;
          await getTasksCollection().doc(taskId).update({'isFav': newValue});
          final message = newValue ? 'add_fav'.tr() : 'remove_fav'.tr();
          final snackBarColor = newValue ? Colors.green : Colors.redAccent;
          showAppSnackBar(context, message,backgroundColor: snackBarColor);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to update task: $e"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Stream<List<TaskModel>> getTasksStream(String category) {
    try {
      if (category == "all") {
        return getTasksCollection().where("userId", isEqualTo:  FirebaseAuth.instance.currentUser!.uid)
            .orderBy("date", descending: false)
            .snapshots()
            .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
      }
      return getTasksCollection()
          .where("category", isEqualTo: category).where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("date", descending: false)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      print("Error fetching tasks: $e");
      return Stream.error("Failed to fetch tasks");
    }
  }

  Stream<List<TaskModel>> getFavTasksStream(String category) {
    try {
      if (category == "all") {
        return getTasksCollection()
            .orderBy("date", descending: false).where("isFav", isEqualTo: true).where("userId", isEqualTo:  FirebaseAuth.instance.currentUser!.uid)
            .snapshots()
            .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
      }
      return getTasksCollection()
          .where("category", isEqualTo: category).where("isFav", isEqualTo: true).where("userId",isEqualTo:  FirebaseAuth.instance.currentUser!.uid)
          .orderBy("date", descending: false)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      print("Error fetching tasks: $e");
      return Stream.error("Failed to fetch tasks");
    }
  }
}
