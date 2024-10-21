import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  
  
  
  
  DialogBox({super.key, required this.controller, required this.onSaved, required this.onCancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(height: 120,
      child: Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
        
        children: [

        //get user input
        TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: "Add New Task"),
        ),


        //button => save or delete
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //save button
          MyButton(text: "Save", onPressed: onSaved),

          const SizedBox(width: 8), 


        //delete button 

          MyButton(text: "Cancel", onPressed: onCancel),
          
          
            
          ],
        ),






      ],),),

    );
  }
}