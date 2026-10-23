class StudentModel {
  String? name;
  int? age;

  StudentModel(this.name, this.age);

  static List<StudentModel> studentData = [
    StudentModel("Dev", 22),
    StudentModel("Shlok", 18),
    StudentModel("Nirav", 16),
    StudentModel("Harsh", 19),
    StudentModel("Hemang", 17),
  ];
}
