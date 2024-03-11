import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/view/addlist.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TodoList',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 25, 168, 30),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false));
                      final user = FirebaseAuth.instance.currentUser;
                 print('${user!.email}');
            },
            icon: Icon(Icons.logout_sharp)),
      ),
      //PreferredSize(preferredSize: Size.fromHeight(80.0),
      //  child: Container(
      //   height: 130,
      //   decoration:  BoxDecoration(
      //     gradient: LinearGradient(
      //       colors:<Color>[
      //         Color.fromARGB(255, 241, 40, 40),
      //          Color.fromARGB(255, 159, 95, 243),
      //          Color.fromARGB(255, 19, 15, 255),
      //          Color.fromARGB(255, 158, 84, 255),

      //         Color.fromARGB(255, 255, 0, 0),

      //       ] ),
      //   ),
      //   child: Text('Todolist'),
      //  )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddDetails()),
          );
          // Get.to(AddDetails());
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Container(
              height: 100,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 180, 180, 180),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 50),
                    child: Text('Name: amar'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text('aga:30'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text('place:mankara'),
                  )
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
