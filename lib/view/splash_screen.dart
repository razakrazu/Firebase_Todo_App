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

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token =  pref.getString('token');
    email =  pref.getString('email');
    name =  pref.getString('name');
    uid =  pref.getString('uid');

    setState(() {});
  }

  @override
  void initState() {
    getData();
    var d = const Duration(seconds: 3);
    Future.delayed(d, () {
      checkLoginState();
    });
    super.initState();
  }

  Future<void> checkLoginState() async {
    if (token == null) {
      Navigator.pushNamed(context, '/');
    } else {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color.fromARGB(255, 0, 77, 87) ,
      body: SafeArea(child: Center(
        child:  Text(
            'TODO APP',
            style: TextStyle(fontWeight: FontWeight.w900,fontSize: 48,color: Colors.white,    fontStyle: FontStyle.italic,),
          ),
      ),),
    );
  }
}
