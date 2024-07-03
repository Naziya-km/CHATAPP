import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class design extends StatefulWidget {
  @override
  State<design> createState() => _designState();
}

class _designState extends State<design> {
  var messagecontroller = TextEditingController();

  String data = "hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: Text("CHATAPP"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('message')
                    .snapshots(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow:
                                    List.filled(2, BoxShadow(blurRadius: 15)),
                                color: Colors.white,
                              ),
                              child:
                                  Text(snapshot.data!.docs[index]["message"]));
                        }),
                  );
                },
              ),
              TextField(
                controller: messagecontroller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    prefixIcon: Icon(Icons.emoji_emotions),
                    suffixIcon: Container(
                      width: 100,
                      child: Row(
                        children: [
                          Icon(Icons.camera),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('message')
                                    .add({
                                  'message': messagecontroller.text,
                                });
                              },
                              child: Icon(Icons.send))
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
