import 'package:btk_student_system/models/student.dart';
import 'package:btk_student_system/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student.withId(0, " ", " ", 0);

  List<Student> students = [
    Student.withId(1, "Mariya", "Özatak", 65),
    Student.withId(2, "Umut", "Özatak", 60),
    Student.withId(3, "Beren", "Özatak", 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 50, 50, 51),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 31, 33),
          leading: IconButton(
            iconSize: 27, // Set the size of the icon
            icon: const Icon(
                Icons.add_outlined), // Set the icon of the IconButton
            onPressed: () {
              // Add your onPressed function here
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.place_sharp, color: Colors.white),
              onPressed: () {},
            )
          ],
          title: const Text('    ÖĞRENCİ BİLGİ SİSTEMİ'),
        ),
        body: buildBody(context));
  }

  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: const Text('iŞLEM'),
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
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/09/01/08/25/smiley-1635456_960_720.png"),
                    ),
                    textColor: Color.fromARGB(255, 196, 195, 195),
                    title: Text(
                        "${students[index].firstName} ${students[index].lastName}"),
                    subtitle: Text(
                        "Puanı: ${students[index].grade}   ${students[index].getStatus}"),
                    trailing: builtStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })),
        Text(
          "Seçili Öğrenci : ${selectedStudent.firstName} ${selectedStudent.lastName}",
          style: TextStyle(
            color: Color.fromARGB(255, 196, 195, 195),
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)))
                      .then((value) {
                    setState(() {});
                  });
                },
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(width: 10),
                    const Text('Yeni Öğrenci'),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 9, 16, 79)),
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
                    const SizedBox(width: 8),
                    const Icon(Icons.update),
                    const SizedBox(width: 15),
                    const Text('Güncelle'),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 0, 0)),
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
                    var message =
                        "Silinen Öğrenci: ${selectedStudent.firstName} ${selectedStudent.lastName}";
                    showMessage(context, message);
                  });
                },
                child: Row(
                  children: [const Icon(Icons.delete), const Text('Sil')],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 165, 0, 0)),
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
      return const Icon(Icons.done, color: Color.fromARGB(255, 153, 255, 0));
    } else if (grade >= 40) {
      return const Icon(Icons.album, color: Colors.lightBlue);
    } else {
      return const Icon(Icons.clear, color: Color.fromARGB(255, 183, 99, 10));
    }
  }
}
