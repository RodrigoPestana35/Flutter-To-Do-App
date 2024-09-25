import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference my box
  final box = Hive.openBox('todoBox');
}
