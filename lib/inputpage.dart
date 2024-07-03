import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var inputcontroller = TextEditingController();
  var input = TextEditingController();
  String data = "no inputs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: inputcontroller,
          ),
          TextField(
            controller: input,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('user')
                    .add({'name': inputcontroller.text, 'age': input.text});
              },
              child: Text("press")),
          Text(data)
        ],
      ),
    );
  }
}
