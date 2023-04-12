import 'package:btk_student_system/models/student.dart';
import 'package:btk_student_system/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Student selectedStudent = Student.withId(0, " ", " ", 0);

  List<Student> students = [
    Student.withId(1, "Mariya", "Özatak", 65),
    Student.withId(2, "Umut", "Özatak", 60),
    Student.withId(3, "Beren", "Özatak", 40)
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 4, 70),
          leading: Container(
            child: IconButton(
              iconSize: 27, // Set the size of the icon
              icon: Icon(Icons.add_outlined), // Set the icon of the IconButton
              onPressed: () {
                // Add your onPressed function here
              },
            ), // Add padding to the Container to make the circle smaller
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.place_sharp, color: Colors.white),
              onPressed: () {},
            )
          ],
          title: Text('    ÖĞRENCİ BİLGİ SİSTEMİ'),
        ),
        body: buildBody(context));
  }

  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text('iŞLEM'),
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
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/09/01/08/25/smiley-1635456_960_720.png"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Puanı: " +
                        students[index].grade.toString() +
                        "   " +
                        students[index].getStatus),
                    trailing: builtStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })),
        Text("Seçili Öğrenci : " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentAdd()));
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 10),
                    Text('Yeni Öğrenci'),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 9, 16, 79)),
                ),
              ),
            ),

            //Update button
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.update),
                    SizedBox(width: 15),
                    Text('Güncelle'),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 255, 0, 0)),
                ),
              ),
            ),

            //Delete button
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                    var message = "Silinen Öğrenci: " +
                        selectedStudent.firstName +
                        " " +
                        selectedStudent.lastName;
                    showMessage(context, message);
                  });
                },
                child: Row(
                  children: [Icon(Icons.delete), Text('Sil')],
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 165, 0, 0)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget builtStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
