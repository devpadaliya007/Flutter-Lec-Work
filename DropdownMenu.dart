import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? city;
  List<String> cities=["Rajkot","Morbi","Surat"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Reg screen"),centerTitle:true,backgroundColor:Color(0xFFD1C4E9),),
        body: Stack(
          children: [
            //Image.asset("assets/image/pic1.jpg");
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage
                    (image: AssetImage("assets/image/")
                    ,fit:BoxFit.cover,)
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Login screen",style: TextStyle(fontSize: 35,color: Color(0xFFD1C4E9)),),
                    SizedBox(height: 10,),
                    TextField(
                      style:TextStyle(fontSize: 20,color: Color(0xFFD1C4E9)),
                      //cursorColor: Color(0xFFD1C4E9),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    DropdownButtonFormField(
                        decoration:InputDecoration(labelText: "Select your city"),
                        value: city,
                        items: cities.map((c)=>
                            DropdownMenuItem(
                                value:c,
                                child: Text(c))).toList(),
                        onChanged: (val)=>setState(() {
                          city=val;
                        })),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){}, child: Text("Login"))
                    //(copy the code)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
