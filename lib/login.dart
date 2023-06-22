// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:get_storage/get_storage.dart';
import 'package:majorproject/config/config.dart';
import 'package:majorproject/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late String currentuserId;
  TextEditingController mobileController =
      new TextEditingController(text: "9733073681");
  TextEditingController passwordController = new TextEditingController();
  final box = GetStorage();

  @override
  @override
  Widget build(BuildContext context) {
    //print(userDetails.registrationDetails);
    return SafeArea(
        child: Scaffold(
      body: Column(
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
            height: 15,
          ),
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 2),
                  child: Column(
                    children: [
                      Form(
                        // key: fomrKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: mobileController,
                              validator: (val) =>
                                  val == "" ? "Please write your mobile" : null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.phone_android,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Your Mobile",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (val) => val == ""
                                  ? "Please write your password"
                                  : null,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Your Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color: Colors.black26)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                                onPressed: () {
                                  GmartApi.signin(mobileController.text,
                                          passwordController.text)
                                      .then((response) async {
                                    print("Login Id:" + response['login_id']);
                                    box.write('login_id',
                                        response['login_id'].toString());
                                    // if (response['status'] == "success") {
                                    //   box.write('login_id', response['login_id']);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home2()));
                                    // } else {
                                    // Alert(
                                    //         context: context,
                                    //         type: AlertType.success,
                                    //         title: "Error",
                                    //         desc: "Error occured")
                                    //     .show();
                                    // }
                                  });
                                },
                                child: Text(
                                  "LogIn",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //bottomNavigationBar: BottomNav(),
    ));
  }
}
