import 'package:flutter/material.dart';

class RowTodo extends StatefulWidget {
  String title;
  String url;
  bool isChecked;

  RowTodo(this.title, this.url, this.isChecked);

  @override
  _RowTodoState createState() =>
      _RowTodoState(this.title, this.url, this.isChecked);
}

class _RowTodoState extends State<RowTodo> {
  String title;
  String url;
  bool isChecked;

  _RowTodoState(this.title, this.url, this.isChecked);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
              setState(
                () {
                  isChecked = value!;
                },
              );
            },
          ),
          Container(
            margin: EdgeInsets.all(12.0),
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.indigo,
                  Colors.lightBlueAccent,
                  Colors.blue,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 4.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              child: ListTile(
                title: Text(title),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }
}
