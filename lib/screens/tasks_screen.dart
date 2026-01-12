import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly4_0/components/task_tile.dart';
import 'package:taskly4_0/model/task_data.dart';
import 'package:taskly4_0/screens/add_task_screen.dart';
import 'package:taskly4_0/theme.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    int taskNumber = Provider.of<TaskData>(context).tasks.length;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Consumer<TaskData>(
          builder: (context, taskData, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 30,
                        child: Icon(
                          Icons.note_alt_sharp,
                          size: 35,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "Taskly",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$taskNumber Tasks",
                        style: TextStyle(color: AppColors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: taskData.tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(task: taskData.tasks[index]);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.white),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
    );
  }
}
