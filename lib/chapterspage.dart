import 'package:flutter/material.dart';
import 'package:studentsbooks/main.dart';
import 'package:studentsbooks/subjectspage.dart';

class Chapter {
  final String chapter;
  // late SubjectsPage gradee;
  Chapter(this.chapter);
}

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({Key? key, required this.subject, required this.grade})
      : super(key: key);
  final Subject subject;
  final String grade;

  List<dynamic> getChapters() {
    List<dynamic> chaps = <Chapter>[];

    chaps.add(Chapter("Chapter 1"));
    chaps.add(Chapter("Chapter 1"));
    chaps.add(Chapter("Chapter 1"));

    return chaps;
  }

  @override
  Widget build(BuildContext context) {
    var chap = getChapters();
    return Scaffold(
      appBar: AppBar(title: Text(subject.subjects)),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
        itemCount: chap.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ChapterBox(chapname: chap[index]),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          );
        },
      ),
    );
  }
}

class ChapterBox extends StatelessWidget {
  const ChapterBox({Key? key, required this.chapname}) : super(key: key);
  final Chapter chapname;
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
        margin:
            EdgeInsets.only(bottom: _w / 50, left: _w / 100, right: _w / 100),
        width: _w,
        height: 120,
        child: Center(
          child: Text(
            chapname.chapter,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
