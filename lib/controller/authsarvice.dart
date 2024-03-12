import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/model/sign_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSarvices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userData');

  Future<UserCredential?> registerUser(SignupModel user) async {
    UserCredential userData = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email.toString(), password: user.password.toString());
    if (userData != null) {
      FirebaseFirestore.instance
          .collection('userData')
          .doc(userData.user!.uid)
          .set({
        'uid': userData.user!.uid,
        'email': userData.user!.email,
        'name': user.name,
        'createdAt': user.createAt,
        'status': user.status,
      });
      return userData;
    } else {
      print('Error');
    }
  }



 Future<DocumentSnapshot?> loginUser(SignupModel user) async{

 DocumentSnapshot? snap;
SharedPreferences pref = await SharedPreferences.getInstance();

  UserCredential usercreantial = await auth.signInWithEmailAndPassword(email: user.email.toString(), password: user.password.toString());

String ? token = await usercreantial.user!.getIdToken();


if(usercreantial != null){


   snap =  await userCollection.doc(usercreantial.user!.uid).get();
await pref.setString('token',token!);
await pref.setString('name', snap['name']);
await pref.setString('email', snap['email']);
return snap;
}

 } 

Future<void>logOut()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.clear();
 await auth.signOut();
}



Future<bool>isloggedin()async {
  SharedPreferences pref  = await SharedPreferences.getInstance();
  String? token = await pref.getString('token');
  if(token == null ){
    return false;
  }else{
    return true;
  }
}
}


