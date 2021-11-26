import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireapp/model/ToDo.dart';
import 'package:fireapp/model/row_todo.dart';
import 'package:fireapp/repository/todo_repostiory.dart';
import 'package:flutter/material.dart';
import 'todo_create_form.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<ToDo> todos = [];

  void _addNewTodo(String input) {


    ToDo todo = ToDo(input, "photo url", false);
    setState(() {

     /* DocumentReference docRef =
      FirebaseFirestore.instance.collection("todos").doc(input);*/

      Map<String, dynamic> todo2 = {
        "title": todo.title,
        "photoUrl": todo.photoUrl,
        "checked": todo.checked,

      };
      Future<DocumentReference<Map<String, dynamic>>> addedTodoInDb = FirebaseFirestore.instance.collection("Todos").add(todo2);

      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(addedTodoInDb);
      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

      DocumentReference<Map<String, dynamic>> docRef;

      Timer(const Duration(milliseconds: 1000), () {
        addedTodoInDb.then((value) {

          var id = value.id;
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          print(id);
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

          var doc = FirebaseFirestore.instance.collection("Todos").doc(id);

          doc.get().then((value) => ({
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"),


        }));

       /*   doc.get() => then((document) {
          print(document("name"));
*/
        });

      });




      todos.add(todo);



    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Create Some Task')),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {},
              child: RowTodo(
                todos[index].title,
                todos[index].photoUrl,
                todos[index].checked,
              ),
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          child: TodoCreateForm(_addNewTodo),
        ),
      ),
    );
  }


}
