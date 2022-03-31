import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test2"),
        ),
        body: Container(
          child: Center(child: Text("Second Page")),
        ));
  }
}
