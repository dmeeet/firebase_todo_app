import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoCreateForm extends StatefulWidget {
  final Function addNewTodo;

  TodoCreateForm(this.addNewTodo);

  @override
  _TodoCreateFormState createState() => _TodoCreateFormState(addNewTodo);
}

class _TodoCreateFormState extends State<TodoCreateForm> {
  _TodoCreateFormState(this.addNewTodo);

  Function addNewTodo;
  String input = "";

/*  createTodos() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("Todos").doc(input);

    Map<String, String> todos = {"Title": input};

    documentReference.set(todos).whenComplete(() {
      print("$input was created");
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.blue,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              "Add New Task",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        onTap: () {
          showDialog(
              useSafeArea: true,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Task Name"),
                  content: TextField(
                    onChanged: (String value) {
                      setState(() {
                        input = value;
                      });
/*                      if (value.isNotEmpty) {
                        print(value);
                        input = value;
                      }*/
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          if (input.isNotEmpty) {
                            addNewTodo(input);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text("Add")),
                  ],
                );
              });
        },
      ),
    );
  }
}
