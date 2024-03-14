import 'package:flutter/material.dart';

class AddDetails extends StatefulWidget {
  AddDetails({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController place = TextEditingController();
  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
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
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
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
          ElevatedButton(onPressed: () async {}, child: const Text('Submit')),
        ],
      )),
    );
  }
}
