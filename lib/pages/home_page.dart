// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final box = Hive.openBox('todoBox');
  ToDoDataBase toDoDataBase = ToDoDataBase();
  //controller for text field
  final controler = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoDataBase.toDoList[index][1] = !toDoDataBase.toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoDataBase.toDoList.add([controler.text, false]);
      controler.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controler: controler,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      toDoDataBase.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("To Do App"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: toDoDataBase.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoDataBase.toDoList[index][0],
            taskCompleted: toDoDataBase.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
