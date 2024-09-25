import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference my box
  final box = Hive.box('todoBox');

  //run this method if this is the first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Buy groceries", false],
      ["Go to the gym", false],
      ["Read a book", false],
    ];
  }

  //load data from database
  void loadData() {
    toDoList = box.get('TODOLIST');
  }

  //Update data in database
  void updateData() {
    box.put('TODOLIST', toDoList);
  }
}
