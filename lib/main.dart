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
        title: Text(headTitle),
      ),
      body: Column(
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
                  String message;
                  int note = 15;

                  if (note >= 50) {
                    message = "Geçti";
                  } else if (note >= 40) {
                    message = "Bütünleme";
                  } else {
                    message = "Kaldı";
                  }

                  var alert = AlertDialog(
                    title: Text('Exam Conclusion'),
                    content: Text(message),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                },
                child: Text('Button')),
          ),
        ],
      ),
    );
  }
}
