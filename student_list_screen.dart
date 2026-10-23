import 'package:flutter/material.dart';
import 'package:lecwork/LecWork/studentmodel.dart';


void main() {
  runApp(StudentListScreen());
}

class StudentListScreen extends StatelessWidget {
  final List<StudentModel> students = StudentModel.studentData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Student List")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: students.map((s){
              return Card(
                color: Colors.white,
                elevation: 4,
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    child: Text(
                      s.name![0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text('Name: ${s.name}'),
                  subtitle: Text('Age: ${s.age}'),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
