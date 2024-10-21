import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // Text Controller
  final _controller = TextEditingController();




  // List of toDo Tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Excercise", false],

    ];


    //checkbox was tapped
    void checkBoxChanged(bool? value, int index){
      setState(() {
        toDoList[index][1] = !toDoList[index][1]; 
        
      });
    }



    // Save New Task

    void saveNewTask(){
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
    }

    //Create New Task

    void createNewTask(){
      showDialog(context: context, builder: (context){return DialogBox(
        controller: _controller,
        onSaved: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        
        
        
        );});
    }

    //Delete Task
    void deleteTask(int index){
      setState(() {
        toDoList.removeAt(index);
      });

    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],


      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("To Do"),
        elevation: 0,
      ),

      // The Plus Button (Bottom Right)
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),


      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
          taskName: toDoList[index][0] ,
          taskCompleted: toDoList [index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index) ,
          );
        },
      ),

    );
  }
}