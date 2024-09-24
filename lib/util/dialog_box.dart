// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controler;
  const DialogBox({
    super.key,
    required this.controler,
  });

  @override
  Widget build(BuildContext context) {
    //dialog box to add new task
    return AlertDialog(
      backgroundColor: Colors.blueGrey[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controler,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
            ),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save and cancel buttons
                MyButton(text: "Save", onPressed: () {}),
                const SizedBox(width: 10),
                MyButton(text: "Cancel", onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
