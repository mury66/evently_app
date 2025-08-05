import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/taskModel.dart';

class FireStoreProvider extends ChangeNotifier
{
  CollectionReference<TaskModel> getTasksCollection()
  {
    return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
        fromFirestore: (snapshot, _) {
          return TaskModel.fromJson(snapshot.data()!);
        },
        toFirestore: (TaskModel task, _) {
          return task.toJson();
        }
    );
  }

  createTask(TaskModel task,context) async {
    try{
      var doc = getTasksCollection().doc();
      task.id = doc.id;
      await doc.set(task);
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text("Task created successfully!",style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
    }
    catch(e)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to create task: $e"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }


  }
  getTasks() async {
    try {
      QuerySnapshot<TaskModel> snapshot = await getTasksCollection().get();
      List<TaskModel> tasks = snapshot.docs.map((doc) => doc.data()).toList();
      return tasks;
    } catch (e) {
      print("Error fetching tasks: $e");
      return [];
    }
  }
}