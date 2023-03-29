import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  String headTitle = 'Student Information System';
  var students = ["Eren Özatak", "Nurullah Özatak", "Beren Özatak"];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.add_a_photo,
            color: Colors.amberAccent,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.place_sharp, color: Colors.white),
              onPressed: () {},
            )
          ],
          title: Text(headTitle),
        ),
        body: buildBody(context));
  }

  String calculateExam(int note) {
    String message = "";

    if (note >= 50) {
      message = "Geçti";
    } else if (note >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }

  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text('Exam Conclusion'),
      content: Text(message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(students[index]);
                })),
        Center(
          child: ElevatedButton(
              onPressed: () {
                var message = calculateExam(55);
                showMessage(context, message);
              },
              child: Text('Button')),
        ),
      ],
    );
  }
}
