import 'package:btk_student_system/models/student.dart';
import 'package:btk_student_system/validations/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudent;

  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  late Student selectedStudent;
  var formkey = GlobalKey<FormState>();

  _StudentEditState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 50, 51),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 31, 33),
        title: const Text('    ÖĞRENCİ BİLGİ SİSTEMİ'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              Icons.person_add,
              size: 60,
              color: Color.fromARGB(255, 161, 151, 182),
            ),
            Text(
              " Yeni Öğrenci Bilgileri",
              style: TextStyle(
                fontSize: 19,
                color: Color.fromARGB(255, 161, 151, 182),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  buildFirstNameField(),
                  SizedBox(
                    height: 5,
                  ),
                  buildLastNameField(),
                  SizedBox(
                    height: 5,
                  ),
                  buildGradeField(),
                  SizedBox(
                    height: 10,
                  ),
                  buildSubmitButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Öğrencinin Adı",
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 196, 195, 195),
          ),
          hintText: "Nurullah",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 196, 195, 195),
          )),
      validator: validateFirstName,
      style: TextStyle(color: Color.fromARGB(255, 196, 195, 195)),
      onSaved: (String? value) {
        selectedStudent.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Öğrencinin Soyadı",
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 196, 195, 195),
          ),
          hintText: "Özatak",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 196, 195, 195),
          )),
      validator: validateLastName,
      style: TextStyle(color: Color.fromARGB(255, 196, 195, 195)),
      onSaved: (String? value) {
        selectedStudent.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Öğrencinin Puanı",
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 196, 195, 195),
          ),
          hintText: "50",
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 196, 195, 195),
          )),
      validator: validateGrade,
      style: TextStyle(color: Color.fromARGB(255, 196, 195, 195)),
      onSaved: (String? value) {
        selectedStudent.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          setState(() {
            Navigator.pop(context);
          });
        }
      },
      child: const Text("Kaydet"),
    );
  }
}
