import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly4_0/components/app_check_box.dart';
import 'package:taskly4_0/components/app_delete_button.dart';
import 'package:taskly4_0/model/task.dart';
import 'package:taskly4_0/model/task_data.dart';

bool isChecked = false;

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.title,
        style: TextStyle(
          fontSize: 18,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppCheckBox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          SizedBox(width: 30),
          AppDeleteButton(
            onPress: () {
              Provider.of<TaskData>(
                context,
                listen: false,
              ).deleteTask(widget.task);
            },
          ),
        ],
      ),
    );
  }
}
