import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final signKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 77, 87),
      body: SafeArea(
          child: Form(
        key: signKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Signup To Your Account',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter Name';
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label:
                        Text('Name', style: themedata.textTheme.displayMedium),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter email';
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label:
                        Text('Email', style: themedata.textTheme.displayMedium),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter password';
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text('Password',
                        style: themedata.textTheme.displayMedium),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: ()async {
    if (signKey.currentState!.validate()) {
      try {
        UserCredential userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (userData != null) {
          FirebaseFirestore.instance.collection('userData')
            .doc(userData.user!.uid)
            .set({
              'uid': userData.user!.uid,
              'email': userData.user!.email,
              'name': nameController.text,
              'createdAt': DateTime.now(),
              'status': 1
            })
            .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false));
        } else {
          print('Error');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // Handle the case where the email is already in use
          print('The email address is already in use.');
          // You can display a snackbar or toast to inform the user
        } else {
          print('Error: $e');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
                },
                child: Container(
                  height: 45,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.green,
                  ),
                  child: Center(
                      child: Text('Signup',
                          style: themedata.textTheme.displayMedium)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already you have an Account? ",
                      style: themedata.textTheme.displayMedium),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new LoginScreen()),
                        );
                      },
                      child: Text('LogIn',
                          style: TextStyle(
                              color: Color.fromARGB(255, 139, 242, 255))))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
