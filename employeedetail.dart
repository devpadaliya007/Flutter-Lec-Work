import 'package:flutter/material.dart';

import 'AddEmployee.dart';

class Employeedetail extends StatelessWidget {
final Map emp;
const Employeedetail({required this.emp});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(emp['name']),backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          children: [
            Text("Name: ${emp['name']}"),
            Text("Job Role: ${emp['jobrole']}"),
          ],
        ),
      ),
    );
  }
}
