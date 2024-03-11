
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddDatas extends GetxController{
  AddDatas get instance => Get.find();
  final TextEditingController name = TextEditingController();
  final  TextEditingController age = TextEditingController();
  final TextEditingController place = TextEditingController();

void addDatas()async {
  try{

  
 await FirebaseFirestore.instance.collection('userDatas')
  .add({
    'name':name.text,
    'age':age.text,
    'place':place.text
 });
print('success');

}catch(Error){
print('error$Error');
}
}

}