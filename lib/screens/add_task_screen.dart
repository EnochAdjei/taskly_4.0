import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly4_0/model/task_data.dart';
import 'package:taskly4_0/theme.dart';

final taskTitleController = TextEditingController();

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Text(
              "New Task",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            TextField(controller: taskTitleController),
            GestureDetector(
              onTap: () {
                String newTaskTitle = taskTitleController.text;
                if (newTaskTitle.isNotEmpty) {
                  Provider.of<TaskData>(
                    context,
                    listen: false,
                  ).addNewTask(newTaskTitle);
                  taskTitleController.clear();

                  Navigator.pop(context);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
