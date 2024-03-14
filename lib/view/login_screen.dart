import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/controller/authsarvice.dart';
import 'package:firebase_todo_app/model/sign_model.dart';
import 'package:firebase_todo_app/view/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final loginkey = GlobalKey<FormState>();
  SignupModel signupModel = SignupModel();
  AuthSarvices authSarvices = AuthSarvices();
  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });
    try {
      signupModel = SignupModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      final data = await authSarvices.loginUser(signupModel);

      if (data != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      List err = e.toString().split(']');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err[1])));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 77, 87),
      body: SafeArea(
          child: Stack(
        children: [
          Form(
            key: loginkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LogIn To Your Account',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter email';
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text('Email',
                          style: themedata.textTheme.displayMedium,),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter email';
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(7)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text('Password',
                          style: themedata.textTheme.displayMedium),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // UserCredential userdata = await FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text.trim(), password: PasswordController.text.trim());

                      //  if(userdata != null){

                      //   Navigator.pushNamedAndRemoveUntil(context,'/home', (route) => false);
                      //  }
                      if (loginkey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('LogIn')),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? ",
                        style: themedata.textTheme.displayMedium),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new SignupScreen()),
                          );
                        },
                        child: const Text('Create Account',
                            style: TextStyle(
                                color: Color.fromARGB(255, 139, 242, 255))))
                  ],
                ),
              ],
            ),
          ),
          Visibility(
              visible: isLoading,
              child:const Center(
                child: CircularProgressIndicator(),
              )),
        ],
      )),
    );
  }
//   login()async{
// try {
//                   UserCredential userData =
//                       await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: EmailController.text.trim(),
//                     password: PasswordController.text.trim(),
//                   );

//                   if (userData != null) {
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, '/home', (route) => false);
//                   }
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'invalid-email') {
//                     print('Invalid email address format.');
//                     // Display a snackbar or toast to inform the user about the invalid email format.
//                   } else if (e.code == 'user-not-found') {
//                     print('No user found with this email.');
//                     // Display a snackbar or toast to inform the user that no account exists with this email.
//                   } else if (e.code == 'wrong-password') {
//                     print('Incorrect password.');
//                     // Display a snackbar or toast to inform the user about the incorrect password.
//                   } else {
//                     print('Error: $e');
//                     // Display a snackbar or toast to inform the user about other errors.
//                   }
//                 } catch (e) {
//                   print('Error: $e');
//                   // Handle other exceptions that might occur during the sign-in process.
//                 }
//   }
}
