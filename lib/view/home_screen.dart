                                                                                                          
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/controller/add_data_controller.dart';
import 'package:firebase_todo_app/controller/authsarvice.dart';
import 'package:firebase_todo_app/model/todo_model.dart';
import 'package:firebase_todo_app/view/addlist.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // final TaskModel? task;
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskSarvices taskSarvice = TaskSarvices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'TodoList',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor:const  Color.fromARGB(255, 0, 77, 87) ,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
           IconButton(
            onPressed: () {
              final user = FirebaseAuth.instance.currentUser;
              AuthSarvices().logOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false));
            },
            icon: const Icon(Icons.power_settings_new)),
        ],
     
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
        backgroundColor: const  Color.fromARGB(255, 0, 77, 87) ,
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new AddDetails()),
          );
          // Get.to(AddDetails());
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child:StreamBuilder<List<TaskModel>>(
            stream: taskSarvice.getAllDatas(),
            //  FirebaseFirestore.instance.collection('personalDatas').snapshots(),
             builder: (context, snapshot) {

              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child:CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return const Center(child:Text('Error'));
              }
              if(snapshot.hasData&& snapshot.data!.length==0){

                return const Center(child:Text(
          'Please Add Members',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),);
              }
              if(snapshot.hasData&& snapshot.data!.length !=  0){
                List<TaskModel> tasks = snapshot.data??[];
                return  ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
        

    final      task= tasks[index];
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,left: 10,right: 10
            ),
            child: Container(
              height: 100,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 180, 180, 180),
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:const EdgeInsets.only(top: 12, left: 50),
                        child: Text('Name: ${task.name}',style:const TextStyle(fontSize: 20,  fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50,top: 4),
                        child: Text('aga: ${task.age}',style:const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50,top: 4),
                        child: Text('place: ${task.place}',style:const TextStyle( fontSize: 17, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
               Padding(
                 padding: const EdgeInsets.all(14),
                 child: Row(
                             
                   children: [
                     IconButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>AddDetails(task: task) ,));
                     }, icon:const Icon(Icons.edit)),
                    const SizedBox(width: 7,),
                       IconButton(onPressed: (){
                      taskSarvice.deleteTask(task.id);  
                       }, icon: const Icon(Icons.delete,color: Color.fromARGB(255, 175, 13, 2),)),
                   ],
                 ),
               )
                ],
              ),
            ),
          );
        },
      );
              }
             return const Center(child:CircularProgressIndicator()); 
             },)
      ),
    );
  }
}
