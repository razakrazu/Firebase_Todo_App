import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_app/controller/add_data_controller.dart';
import 'package:firebase_todo_app/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddDetails extends StatefulWidget {
  final TaskModel? task;
  AddDetails({super.key,this.task});


  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final taskkey = GlobalKey<FormState>();
    final TextEditingController nameCotllr = TextEditingController();
  final TextEditingController ageCotllr = TextEditingController();
  final TextEditingController placeCotllr = TextEditingController();
  TaskSarvices taskSarvice = TaskSarvices();
 bool edit =  false;
  @override
  void dispose() {
    nameCotllr.dispose();
    ageCotllr.dispose();
    placeCotllr.dispose();
    super.dispose();
  }
  loadData(){
if(widget.task!= null ){
  setState(() {
        nameCotllr.text =widget.task!.name!;
    ageCotllr.text= widget.task!.age!;
    placeCotllr.text =widget.task!.place!;
    edit = true;
  });
}
  }
  @override
  void initState() {
loadData(); 
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        edit ==true? 
        const Text(
          'UPDATE DATA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ):
   const     Text(
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
        const    SizedBox(height: 30,),
              InkWell(
                    onTap: () async {
                       if(taskkey.currentState!.validate()){
                  if(edit){
                    TaskModel taskModel = TaskModel(
                      id: widget.task?.id,
                      name: nameCotllr.text,
                      age: ageCotllr.text,
                      place: placeCotllr.text,
                    );
taskSarvice.updateTask(taskModel).then((value) =>Navigator.pop(context) );
                  }else{
                    addTask();
                  }
                }
                    },
                    child: Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const  Color.fromARGB(255, 0, 77, 87) , 
                      ),
                      child: Center(
                          child:
                           edit == true?
                           const Text('UPDATE',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
                              ):const Text('ADD',style:  TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
                              )
                              ),
                    ),
                  ),
            
       
                  ],
                ),
          )),
    );
  }
  addTask()async{
    var id =const Uuid().v1();
    TaskModel  taskModel = TaskModel(
      stutas: 1,
    id: id,
    name: nameCotllr.text,
    age:  ageCotllr.text,
    place: placeCotllr.text,
    createAt: Timestamp.now());
    TaskSarvices? taskSarvice = TaskSarvices();
    final task = await taskSarvice.createTask(taskModel);
    if(task != null ){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Task created'))));
    }
  }
}
