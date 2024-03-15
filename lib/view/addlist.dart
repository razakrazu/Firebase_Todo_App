import 'package:firebase_todo_app/controller/add_data_controller.dart';
import 'package:firebase_todo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:uuid/uuid.dart';

class AddDetails extends StatefulWidget {
  AddDetails({super.key});


  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final taskkey = GlobalKey<FormState>();
    final TextEditingController nameCotllr = TextEditingController();
  final TextEditingController ageCotllr = TextEditingController();
  final TextEditingController placeCotllr = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD DETAILS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const  Color.fromARGB(255, 0, 77, 87) ,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Form(
            key: taskkey,
            child: Column(
                  children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller:nameCotllr ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  label: const Text('Name'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ageCotllr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  label: const Text('Age'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: placeCotllr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  label: const Text('Place'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () async {
                if(taskkey.currentState!.validate()){
                  addTask();
                }
            }, child: const Text('Submit')),
                  ],
                ),
          )),
    );
  }
  addTask()async{
    var id =Uuid().v1();
    TaskModel  taskModel = TaskModel(
      stutas: 1,
    id: id,
    name: nameCotllr.text,
    age:  ageCotllr.text,
    place: placeCotllr.text,
    createAt: DateTime.now());
    TaskSarvices? taskSarvice = TaskSarvices();
    final task = await taskSarvice.createTask(taskModel);
    if(task != null ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task created')));
    }
  }
}
