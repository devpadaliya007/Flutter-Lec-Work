import 'package:flutter/material.dart';
import 'package:lecwork/LecWork/profilepage.dart';



import 'emplist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex=0;
  final List<Widget> pageList=[
    Center(child: Text("Home page"),),
    Center(child: Text("Home page"),),
    // profilepage(),
    EmployeeListPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar
        (
          currentIndex: selectedIndex,
          onTap: (val){
            setState(() {
              selectedIndex=val;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),

            BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Profile"),

            BottomNavigationBarItem(icon: Icon(Icons.list),label: "Employe List"),
          ]),
    );
  }
}