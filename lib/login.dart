import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:todoapp/register.dart';
import 'package:todoapp/homescreen.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: content(),
      backgroundColor: Color.fromARGB(255, 145, 127, 179),
    );
  }

  Widget content() {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 229, 190, 236),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/todologo.png"),
              Text(
                '𝓛𝓸𝓰𝓲𝓷',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Row(
            children: [
              //Text("Email: ",
              //style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.mail,
                color: Colors.black,
                size: 30.0,
              ),
              SizedBox(width: 5),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 226, 243),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                child: TextField(
                  //controller: myController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Enter Your Email",
                  ),
                ),
              ))
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Row(
            children: [
              //Text("Password: ",
                //  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.lock,
                color: Colors.black,
                size: 30.0,
              ),
              SizedBox(width: 5),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 226, 243),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                child: TextField(
                  //controller: myController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "Enter Your Password",
                  ),
                ),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Forgot Password",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ))
        ])),
        SizedBox(height: 10),
        Container(
          height: 45,
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 42, 47, 79),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              //Navigator.of(context).pushNamed("/event_calendar_screen");
               Get.to(()=>const Homescreen());
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Dont have an Account?",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              )),
          TextSpan(
            text: " Register Here!",
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(154, 2, 2, 113),
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //Navigator.of(context).pushNamed("/register");
                Get.to(()=>const Register());
              },
          )
        ]))
      ],
    );
  }
}
