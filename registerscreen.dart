import 'package:flutter/material.dart';
import 'package:lecwork/LecWork/Login.dart';
import 'package:lecwork/LecWork/profilepage.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordV=true;
  final validate=GlobalKey<FormState>();
  final _uname=TextEditingController();
  final _email=TextEditingController();
  final _password=TextEditingController();
  String? city;
  String? gender;
  List<String> cities=["Rajkot", " Pune" , "Mumbai"];
  final List<String> _hobbies = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Register screen"),centerTitle:true,),
      body: Center(
        child: SingleChildScrollView(
        child: Card(
          shadowColor: Colors.purple,
          elevation: 50,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          child: Form(
            key: validate,
            child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(0), // Can be omitted since it's zero
                  child: Image.asset("assets/img/reg.jpg"),
                ),

                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _uname,
                    validator: (dynamic msg){
                      if(msg.isEmpty || msg==null){
                        return "Enter valid user name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.verified_user),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _email,
                    validator: (dynamic msg){
                      if(msg.isEmpty || msg==null){
                        return "Enter valid Email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),
                      prefixIcon: Icon(Icons.mail_outline_outlined),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _password,
                    validator: (dynamic msg){
                      if(msg.isEmpty || msg==null){
                        return "Enter valid password";
                      }
                      return null;
                    },
                    obscureText: passwordV,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordV = !passwordV;
                          });
                        },
                        icon: Icon(passwordV ? Icons.visibility_off : Icons.visibility),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (dynamic msg){
                      if(msg.isEmpty || msg==null){
                        return "Enter valid confirm password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter your confirm password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),
                      prefixIcon: Icon(Icons.verified_user),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    validator: (dynamic msg){
                      if(msg.isEmpty || msg==null){
                        return "Enter valid mobile number ";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "User Mobile Number",
                      hintText: "Enter your mobile number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                //drop down box
                SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      labelText: "Select Your City"
                  ),
                  value: city,
                  items: cities.map((c) =>
                      DropdownMenuItem(
                          value : c,
                          child: Text(c)
                      )
                  ).toList(),
                  onChanged: (val)
                  {
                    setState(() {
                      city = val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Radio(value: "Male",
                        groupValue: gender,
                        onChanged: (val)
                        {
                          setState(() {
                            gender = val;
                          }
                          );
                        }
                    ),
                    Text("Male"),
                    Radio(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (value)
                        {
                          setState(() {
                            gender = value;
                          });
                        }),
                    Text("Female")
                  ],
                ),
                 SizedBox(height: 20),
                 Text("Hobbies"),
                CheckboxListTile(
                  title: const Text("Photography"),
                  value: _hobbies.contains("Photography"),
                  onChanged: (val) {
                    setState(() {
                      val!
                          ? _hobbies.add("Photography")
                          : _hobbies.remove("Photography");
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Painting"),
                  value: _hobbies.contains("Painting"),
                  onChanged: (val) {
                    setState(() {
                      val!
                          ? _hobbies.add("Painting")
                          : _hobbies.remove("Painting");
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text("Sports"),
                  value: _hobbies.contains("Sports"),
                  onChanged: (val) {
                    setState(() {
                      val! ? _hobbies.add("Sports") : _hobbies.remove("Sports");
                    });
                  },
                ),
                SizedBox(height: 20,),
                // ElevatedButton(onPressed: () {
                //   // validate.currentState!.validate();
                //   if(validate.currentState?.validate()??false){
                //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reg.Done")));
                //   }
                //   Navigator.push(context, MaterialPageRoute(builder:(_)=>profilepage(name: _uname.text, email: _email.text, gender: gender!, city: city!, hobbies: _hobbies,)));
                // }, child: Text("Submit")),
                ElevatedButton(
                  onPressed: () {
                    if (validate.currentState?.validate() ?? false) {
                      if (gender == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please select gender"))
                        );
                        return;
                      }

                      if (city == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please select city"))
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Registration Done"))
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => profilepage(
                            name: _uname.text,
                            email: _email.text,
                            gender: gender!,
                            city: city!,
                            hobbies: _hobbies,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Submit"),
                ),


                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(_)=>LoginScreen()));
                }, child: Text("Login here")),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}