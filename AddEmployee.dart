import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:lecwork/filehelper.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  String? position;
  File? imageFile;
  List<String> positions = ["UI/UX", "DOTNET", "HR", "Developer"];

  Future<void> _pickImage() async {
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker != null) {
      setState(() {
        imageFile = File(picker.path);
      });
    }
  }

  void saveEmployee() async {
    if (_name.text.isEmpty ||
        _email.text.isEmpty ||
        position == null ||
        imageFile == null)
      return;
    await DBHelper.insertData({
      'name': _name.text,
      'email': _email.text,
      'position': position,
      'image': imageFile!.path,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Employee")),
      body: Column(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
              child: imageFile == null ? Icon(Icons.add_photo_alternate) : null,
            ),
          ),
          TextField(controller: _name),
          TextField(controller: _email),
          DropdownButtonFormField(
            decoration: InputDecoration(label: Text("Select your position")),
            items: positions
                .map((pos) => DropdownMenuItem(child: Text(pos), value: pos))
                .toList(),
            onChanged: (val) {
              setState(() {
                position = val as String;
                print(position);
              });
            },
          ),
          ElevatedButton(onPressed: saveEmployee, child: Text("Add Employee")),
        ],
      ),
    );
  }
}
