 import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel{
  final String? id;
  final String? name;
   final String? age;
  final String? place;
  final int? stutas;
  DateTime? createAt;
  
  TaskModel(  {
    this.id,
    this.name,
    this.age,
   this.place,
   this.stutas,
   this.createAt,
    });



factory TaskModel.fromJson(DocumentSnapshot json){
return TaskModel(
  id: json['id'],
  name: json['name'],
  createAt: json['createAt'],
  stutas:  json['stutas'],
  age: json['age'],
  place: json['place'],
);
}
Map<String,dynamic>toMap(){
  return {
    'id':id,
    'name':name,
    'place':place,
    'age':age,
    'stutas':stutas,
    'createAt':createAt,

  };
}
 }