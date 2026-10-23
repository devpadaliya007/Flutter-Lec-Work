import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo App Bar"),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          leading: Icon(Icons.menu_book_rounded),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
          elevation: 10,
          shadowColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(12.0),
            decoration:BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                  color: Colors.lightGreenAccent,
                  blurRadius: 17,
                )
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-vector/register-now-speech-bubble-collection-iconlabel-sticker-logo-badge-banner-design-template_359398-2303.jpg?semt=ais_items_boosted&w=740"),
                ),
                SizedBox(height: 10),
                Text("Dev", style: TextStyle(color: Colors.blue, fontSize: 40)),
                SizedBox(height: 20),
                Text("App Developer"),
                SizedBox(height: 20),
                SizedBox(
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.share),
                      Icon(Icons.call),
                      Icon(Icons.home_filled),
                    ],
                  ),
                ),SizedBox(height: 20,),
                TextField(
                  obscureText: false, //true api for hidden text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
