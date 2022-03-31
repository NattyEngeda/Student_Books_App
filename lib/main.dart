import 'package:flutter/material.dart';
import 'lists.dart';
import 'subjectspage.dart';
import 'test/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Grades grades = new Grades();
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Grade"),
        ),
        body: GridView.builder(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
          itemCount: grades.grade.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: GradeBox(grades: grades.grade[index]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubjectsPage(
                              ggrade: grades.grade[index],
                            )));
              },
            );
          },
        ));
  }
}

class GradeBox extends StatelessWidget {
  const GradeBox({Key? key, required this.grades}) : super(key: key);
  final String grades;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  spreadRadius: 1),
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //Box
            ]),
        margin: EdgeInsets.only(bottom: _w / 30, left: _w / 60, right: _w / 60),
        child: Center(
          child: Text(
            grades,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
