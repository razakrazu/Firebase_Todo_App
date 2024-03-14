import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo_app/firebase_options.dart';
import 'package:firebase_todo_app/view/addlist.dart';
import 'package:firebase_todo_app/view/home_screen.dart';
import 'package:firebase_todo_app/view/login_screen.dart';
import 'package:firebase_todo_app/view/signup_screen.dart';
import 'package:firebase_todo_app/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/splash',
      routes: {
        '/':(context) => LoginScreen(),
        '/register':(context) => SignupScreen(),
        '/home':(context) => HomeScreen(),
        '/addtask':(context) => AddDetails(),
        '/splash':(context) => SplashScreen(),
      },
      theme: ThemeData(
textTheme: TextTheme(
  displayMedium: TextStyle(color: Colors.white,fontSize:18 )
),
        // colorScheme: ColorScheme.fromSeed(seedColor:  Colors.white),
        // useMaterial3: true,
      ),
    );
  }
}

