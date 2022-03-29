import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'lists.dart';
import 'subjectspage.dart';

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
      theme: ThemeData(primarySwatch: Colors.blueGrey),
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
      body: AnimationLimiter(
          child: GridView.builder(
        padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
        itemCount: grades.grade.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: Duration(milliseconds: 200),
            columnCount: 2,
            child: ScaleAnimation(
              duration: Duration(milliseconds: 900),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                  child: GestureDetector(
                child: GradeBox(grades: grades.grade[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectsPage(
                                ggrade: grades.grade[index],
                              )));
                },
              )),
            ),
          );
        },
      )),
    );
  }
}

class GradeBox extends StatelessWidget {
  const GradeBox({Key? key, required this.grades}) : super(key: key);
  final String grades;
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
            grades,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Grades grades = new Grades();
//     double _w = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Grade"), backgroundColor: Colors.teal),
//         body: AnimationLimiter(
//             child: GridView.builder(
//           padding: EdgeInsets.fromLTRB(5, 15, 5, 10),
//           itemCount: grades.grade.length,
//           physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics()),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
//           itemBuilder: (BuildContext context, int index) {
//             return AnimationConfiguration.staggeredGrid(
//               position: index,
//               duration: Duration(milliseconds: 200),
//               columnCount: 2,
//               child: ScaleAnimation(
//                 duration: Duration(milliseconds: 900),
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 child: FadeInAnimation(
//                   child: Container(
//                     child: Center(
//                       child: GestureDetector(
//                         child: Text(
//                           grades.grade[index],
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 40),
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SubjectsPage(
//                                         ggrade: grades.grade[index],
//                                       )));
//                         },
//                       ),
//                     ),
//                     margin: EdgeInsets.only(
//                         bottom: _w / 30, left: _w / 60, right: _w / 60),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 40,
//                           spreadRadius: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         )),
//       ),
//     );
//   }
// }



//  ),
//         GestureDetector(
          
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => SubjectsPage(
//                           ggrade: grades.grade[index],
//                         )));
//           },
//         ),