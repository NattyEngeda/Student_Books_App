import 'package:flutter/material.dart';
import 'test2.dart';

class TestW extends StatelessWidget {
  const TestW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test One"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Test2()));
        },
        child: const Card(
          margin: EdgeInsets.all(20),
          shadowColor: Colors.black,
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Click",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
