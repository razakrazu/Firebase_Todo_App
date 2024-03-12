import 'package:cloud_firestore/cloud_firestore.dart';

class SignupModel {
  final String? email;
  final String? name;
  final String? password;
  final String? uid;
  final DateTime? createAt;
  final int? status;
  SignupModel({
     this.name,
     this.email,
     this.password,
     this.createAt,
     this.status,
     this.uid,
  });

  factory SignupModel.fromJson(DocumentSnapshot data) {
    return SignupModel(
        name: data['name'],
        email: data['email'],
        password: data['password'],
        createAt: data['createAt'],
        status: data['status'],
        uid: data['uid']);
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'status': status,
      'createAt': createAt,
    };
  }
}
