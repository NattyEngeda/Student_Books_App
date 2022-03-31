import 'package:flutter/material.dart';
import 'chapterspage.dart';

class Subject {
  final String subjects;
  late SubjectsPage gradee;
  Subject(this.subjects);
}

class SubjectsPage extends StatelessWidget {
  SubjectsPage({Key? key, required this.ggrade}) : super(key: key);
  final String ggrade;

  List<dynamic> getSubjects() {
    List<dynamic> subs = <Subject>[];

    switch (ggrade) {
      case "Grade 12":
        subs.add(Subject("Grade 12"));
        subs.add(Subject("English"));
        subs.add(Subject("Math"));
        subs.add(Subject("ICT"));
        subs.add(Subject("Civics"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Chemistry"));
        subs.add(Subject("Physics"));
        subs.add(Subject("T.D."));
        subs.add(Subject("History"));
        subs.add(Subject("Geography"));
        subs.add(Subject("Economis"));
        subs.add(Subject("General Business"));
        subs.add(Subject("HPE"));
        break;
      case "Grade 11":
        subs.add(Subject("Grade 11"));
        subs.add(Subject("English"));
        subs.add(Subject("Math"));
        subs.add(Subject("ICT"));
        subs.add(Subject("Civics"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Chemistry"));
        subs.add(Subject("Physics"));
        subs.add(Subject("T.D."));
        subs.add(Subject("History"));
        subs.add(Subject("Geography"));
        subs.add(Subject("Economis"));
        subs.add(Subject("General Business"));
        subs.add(Subject("HPE"));
        break;
      case "Grade 10":
        subs.add(Subject("Grade 10"));
        subs.add(Subject("Amharic"));
        subs.add(Subject("English"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Math"));
        subs.add(Subject("Chemistry"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Physics"));
        subs.add(Subject("Geography"));
        subs.add(Subject("History"));
        subs.add(Subject("ICT"));
        subs.add(Subject("Civic"));
        subs.add(Subject("HPE"));

        break;
      case "Grade 9":
        subs.add(Subject("Grade 9"));
        subs.add(Subject("Grade 10"));
        subs.add(Subject("Amharic"));
        subs.add(Subject("English"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Math"));
        subs.add(Subject("Chemistry"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Physics"));
        subs.add(Subject("Geography"));
        subs.add(Subject("History"));
        subs.add(Subject("ICT"));
        subs.add(Subject("Civic"));
        subs.add(Subject("HPE"));

        break;
      case "Grade 8":
        subs.add(Subject("Grade 8"));

        break;
      case "Grade 7":
        subs.add(Subject("Grade 7"));

        break;
      default:
    }

    return subs;
  }

  @override
  Widget build(BuildContext context) {
    var subbs = getSubjects();

    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(ggrade),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
        itemCount: subbs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: SubjectBox(subname: subbs[index]),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChaptersPage(
                            subject: subbs[index],
                            grade: ggrade,
                          )));
            },
          );
        },
      ),
    );
  }
}

class SubjectBox extends StatelessWidget {
  const SubjectBox({Key? key, required this.subname}) : super(key: key);
  final Subject subname;
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
            this.subname.subjects,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
