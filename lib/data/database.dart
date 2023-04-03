import 'package:hive_flutter/adapters.dart';

class ToDoDataBase {
  List toDolist = [];
  //reference the box
  final _myBox = Hive.box('myBox');

  // first opening of the app
  void createInitialData(){
    toDolist = [
    ["Coder", true],
    ["Manger", true]
  ];
  }

  //load the data

  void loadData(){
    toDolist = _myBox.get('TODOLIST');
  }

  //update the data

  void updateDataBase(){
    _myBox.put('TODOLIST', toDolist);
  }

}