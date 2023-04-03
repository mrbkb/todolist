import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manui/components/dialog_box.dart';
import 'package:manui/components/todo_tile.dart';
import 'package:manui/data/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //very first  opening 
    if (_myBox.get('TODOLIST') == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //reference my box
  final _myBox = Hive.box('myBox'); 

  //text controller
  final _controller = TextEditingController();

  //list of todo tasks
  ToDoDataBase db=  ToDoDataBase();

  
  //checkbox changed


  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateDataBase();
  }

//create a new task

  void createNewTask() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(
            controller: _controller,
            onsaved: saveNewTask,
            oncancel: Navigator.of(context).pop,
          );
        }));
        db.updateDataBase();
  }

//save new task
  void saveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

//delete task
void deleteTask(int index){
setState(() {
  db.toDolist.removeAt(index);
});
db.updateDataBase();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("ToDo"),
        elevation: 0,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) {
              checkboxchanged(value, index);
            },
            deleteFunction: ((context) =>deleteTask(index) ),
          );
        },
      ),
    );
  }
}
