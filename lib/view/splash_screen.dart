import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  String? name;
  String? email;
  String? uid;
  String? token;

getData() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = await pref.getString('token');
  email = await pref.getString('email');
  name = await pref.getString('name');
  uid = await pref.getString('uid');

setState(() {
    
});

}
@override
  void initState(){
  getData();
  var d = Duration(seconds: 3);
  Future.delayed(d,(){
    checkLoginState();
  });
  super.initState();
}

Future<void> checkLoginState()async{
  if(token== null){
    Navigator.pushNamed(context, '/');


  }else{
    Navigator.pushNamed(context, '/home');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text('hewllo')),);
  }
}