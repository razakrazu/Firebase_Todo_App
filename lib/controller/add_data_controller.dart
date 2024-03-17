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

Stream<List<TaskModel>>getAllDatas(){
  try{
return taskCollection.snapshots().map((QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
return TaskModel.fromJson(doc);
  }).toList();
},);
 

  }on FirebaseException catch(e){
print(e);
throw(e);
  }
}
Future<void> updateTask(TaskModel task)async{
  try {
    final taskMap = task.toMap();
      await taskCollection.doc(task.id).update(taskMap);
  }on FirebaseException catch(e){
    print(e.toString());
  }

}
Future<void>deleteTask(String? id )async{
  try{
    await taskCollection.doc(id).delete();
  }on FirebaseException catch(e){
    print(e.toString());
  }
}

}