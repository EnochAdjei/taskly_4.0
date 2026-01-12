import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly4_0/model/task_data.dart';
import 'package:taskly4_0/screens/tasks_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    ),
  );
}
