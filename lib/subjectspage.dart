import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'lists.dart';

class SubjectsPage extends StatelessWidget {
  SubjectsPage({Key? key, required this.ggrade}) : super(key: key);
  final String ggrade;

  String get() {
    return ggrade;
  }

  late String newGrade = get();

  final subbs = Subject(newGrade);
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(ggrade), backgroundColor: Colors.teal),
        body: AnimationLimiter(
            child: ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
          itemCount: subbs.length,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: Duration(milliseconds: 200),
              columnCount: 2,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  child: Container(
                    width: _w,
                    height: 100,
                    child: Center(
                      child: GestureDetector(
                        child: Text(
                          sub.subject[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40),
                        ),
                        onTap: () {
                          // Navigator.push(/
                          // context,
                          // MaterialPageRoute(
                          //     // builder: (context) => ()));
                        },
                      ),
                    ),
                    margin: EdgeInsets.only(
                        bottom: _w / 30, left: _w / 60, right: _w / 60),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}

class SubjectBox extends StatelessWidget {
  const SubjectBox({Key? key, required this.subname}) : super(key: key);
  final String subname;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(bottom: _w / 30, left: _w / 60, right: _w / 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            subname,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}

class Subject {
  final String grades;
  Subject(this.grades);

  static List<Subject> getSubjects(grades) {
    List<Subject> subs = <Subject>[];
    switch (grades) {
      case "Grade 12":
        subs.add(Subject("Amharic"));
        subs.add(Subject("English"));
        subs.add(Subject("Math"));
        subs.add(Subject("Biology"));
        subs.add(Subject("Physics"));
        subs.add(Subject("Chemistry"));
        subs.add(Subject("History"));
        subs.add(Subject("Geography"));
        subs.add(Subject("Economis"));
        subs.add(Subject("TD"));
        subs.add(Subject("HPE"));

        break;
      case "Grade 11":
        break;
      case "Grade 10":
        break;
      case "Grade 9":
        break;
      case "Grade 8":
        break;
      case "Grade 7":
        break;

      default:
    }

    return subs;
  }
}
