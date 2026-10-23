import 'package:flutter/material.dart';
import 'package:lecwork/LecWork/homepage.dart';
import 'package:lecwork/LecWork/registerscreen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login screen"),),
        body:Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img/reg.jpg"),fit: BoxFit.cover)
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Login screen',style: TextStyle(fontSize: 38),),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Enter your Email",
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Enter your Password",
                          hintText: "Enter your Password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(_)=>Homepage()));
                    }, child: Text("Login")),
                    TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(_)=>Register()));
                    }, child: Text("Register Here"))
                  ],
                ),
              ),
            )
            // Image.asset("assets/img/pic-1.png"),
          ],
        )
    );
  }
}