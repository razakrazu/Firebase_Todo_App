import 'package:firebase_todo_app/controller/controllor_adddata.dart';
import 'package:flutter/material.dart';

class AddDetails extends StatefulWidget {
   AddDetails({super.key});


  final TextEditingController name = TextEditingController();
  final  TextEditingController age = TextEditingController();
  final TextEditingController place = TextEditingController();
  @override
  State<AddDetails> createState() => _AddDetailsState();
}


class _AddDetailsState extends State<AddDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('ADD DETAILS',style:TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Color.fromARGB(255, 25, 168, 30),centerTitle: true,),

      body: SafeArea(child: Column(
        children: [
      SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                   decoration:InputDecoration(
            border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
            ),
            label: Text('Name'),
                   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                   decoration:InputDecoration(
            border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
            ),
            label: Text('Age'),
                   ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                   decoration:InputDecoration(
            border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
            ),
            label: Text('Place'),
                   ),
            ),
          ),
                SizedBox(height: 30,),
      
          ElevatedButton(onPressed: ()async{
          }, child:Text('Submit')),
        ],
      )),
      );
    
  }
}
