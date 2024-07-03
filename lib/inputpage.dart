import 'package:chatapp/chatd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var namecontroller = TextEditingController();

  String data = "no inputs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: namecontroller,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return design(
                      name: "sam",
                    );
                  },
                ));
              },
              child: Text("press")),
          Text(data)
        ],
      ),
    );
  }
}
