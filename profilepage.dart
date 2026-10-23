import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  final String name;
  final String email;
  final String gender;
  final String city;
  List<String> hobbies;

   profilepage({super.key, required this.name, required this.email, required this.gender, required this.city,required this.hobbies});


  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Your name is ${widget.name}"),
          Text("Your email is ${widget.email}"),

        ],
      )
    );
  }
}
