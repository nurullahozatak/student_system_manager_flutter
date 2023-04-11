class Student {
  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String _status = "";

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.id = id;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getFirstName {
    return "OGR -" + this.firstName;
  }

  void set setFirstName(String firstName) {
    this.firstName = firstName;
  }

  String get getStatus {
    String message = "";

    if (grade >= 50) {
      message = "Geçti";
    } else if (grade >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
