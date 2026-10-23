// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:lecwork/LecWork/employeedetail.dart';
//
// import 'AddEmployee.dart';
//
// class EmpList extends StatefulWidget {
//   const EmpList({super.key});
//
//   @override
//   State<EmpList> createState() => _EmpListState();
// }
//
// class _EmpListState extends State<EmpList> {
//   List employee=[];
//   void initState()
//   {
//     loadData();
//   }
//   Future<void> loadData() async
//   {
//     final data=await rootBundle.loadString("assets/data/employee.json");
//     setState(() {
//       employee=json.decode(data);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: employee.length,
//         itemBuilder: (context,index) {
//           final emp=employee[index];
//           return ListTile(
//             title: Text(emp['name']),
//             subtitle: Text(emp['jobrole']),
//             onTap:(){
//               Navigator.push(context, MaterialPageRoute(builder:(_)=>Employeedetail(emp: emp,)));
//             },
//           );
//         }
//     ),
//         floatingActionButton: FloatingActionButton(
//         onPressed: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => AddEmployee()),
//       );
//     },
//     child: Icon(Icons.add),
//     ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lecwork/LecWork/AddEmployee.dart';
import 'package:lecwork/filehelper.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  List<Map<String, dynamic>> employee = [];

  @override
  void initState() {
    loadEmployee();
  }

  Future<void> loadEmployee() async {
    final data = await DBHelper.getEmployee();
    setState(() {
      employee = data;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        //physics: NeverScrollableScrollPhysics(),//list view cannot scroll
        itemCount: employee.length,
        itemBuilder: (context, index) {
          final emp = employee[index];
          {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: File(emp['image']).existsSync()
                    ? FileImage(File(emp['image']))
                    : null,
              ),
              title: Text(emp['name']),
              subtitle: Text(emp['position']),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed:()async{
        final result=await
            Navigator.push(context,MaterialPageRoute(builder: (_)=>AddEmployee()));
        if(result==true)
          {
            loadEmployee();
          }
      }),
    );
  }
}
