import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Editemployee extends StatefulWidget {
  Editemployee({super.key,required this.emp1});
  Map<String,dynamic> emp1;
  @override
  State<Editemployee> createState() => _EditemployeeState();
}

class _EditemployeeState extends State<Editemployee> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon=TextEditingController();
  String? position;
  File? imagePath;
  List<String> positions = ["UI/UX", "DOTNET", "HR", "Developer"];

  void initState()
  {
    nameCon.text=widget.emp1['name'];
    emailCon.text=widget.emp1['email'];
    position=widget.emp1['position'];
    imagePath=widget.emp1['image'];
  }
  Future<void> _pickImage() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      setState(() {
        imagePath = File(picker.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit"),),
      body: Column(
        children: [
          TextField(
            controller: nameCon,
          ),
          TextField(
            controller: emailCon,
          ),
          DropdownButtonFormField(
              value: position,
              items: positions.map((pos){
                return DropdownMenuItem(
                  value: pos,
                    child: Text(pos)
                );
              }).toList(),
              onChanged: (val){
                setState(() {
                  position=val as String;
                });
              })
        ],
      ),
    );
  }
}
