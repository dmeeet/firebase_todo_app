import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireapp/model/ToDo.dart';

class TodoRepository {
  //Hochu chtob eto bil singalton...

  static final String _collectionName = "Todos";
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static List<ToDo> getAll()  {
    List<ToDo> items = [];

    return items;

  }
}
