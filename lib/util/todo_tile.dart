// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.green[800],
          ),
          Text(
            taskName,
            style: TextStyle(
                fontSize: 18,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ]),
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
