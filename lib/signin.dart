import 'package:flutter/material.dart';
import 'package:majorproject/home.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 224, 195, 36),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 500,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 113, 233, 229),
                  Color.fromARGB(255, 40, 178, 220)
                ])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Welcome to Gmart!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height/8,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: 500,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 242, 242),
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "Enter Your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black26)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black26)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        ),
                      ),
                      SizedBox(height: 30,),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Enter Your Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black26)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black26)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: "Enter Your Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black26)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.black26)),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height:MediaQuery.of(context).size.height/25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () { Navigator.push(context,
                          MaterialPageRoute(builder: ((context) =>home())));},
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              SizedBox(
                 height:MediaQuery.of(context).size.height/15,
              ),
              Container(
                height: 60,
                width: 100,
               
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 17, 97, 163),),
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Sign up",style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
