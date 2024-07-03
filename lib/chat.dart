import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "button",
                  style: TextStyle(backgroundColor: Color(23)),
                ))
          ],
        ),
      ),
    );
  }
}
