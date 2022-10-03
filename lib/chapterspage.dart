import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:studentsbooks/main.dart';
import 'package:studentsbooks/pdfveiwer.dart';
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
    double _w = MediaQuery.of(context).size.width;
    var chap = getChapters();
    return Scaffold(
      appBar: AppBar(title: Text(subject.subjects)),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: chap.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: Duration(milliseconds: 100),
                child: SlideAnimation(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    // horizontalOffset: 30,
                    // verticalOffset: 300.0,
                    child: FadeInAnimation(
                      duration: Duration(milliseconds: 1000),
                      child: GestureDetector(
                        child: ChapterBox(chapname: chap[index]),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFView()));
                        },
                      ),
                    )));
          },
        ),
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
        margin: EdgeInsets.only(bottom: _w / 20),
        height: _w / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
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
            chapname.chapter,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
