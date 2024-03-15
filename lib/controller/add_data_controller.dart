import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_app/model/todo_model.dart';

class TaskSarvices{
  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('personalDatas');

Future<TaskModel?>createTask(TaskModel task)async{


  try{
    final taskMap = task.toMap();
    await taskCollection.doc(task.id).set(taskMap);
    return task;

  }on FirebaseException catch(e){
    print(e.toString());
  }
}



}