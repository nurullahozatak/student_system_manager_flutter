import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentAddState();
  }
}

class StudentAddState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci Ekle")),
      body: Center(
        child: Text("New Student"),
      ),
    );
  }
}
