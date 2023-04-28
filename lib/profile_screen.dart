import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todoapp/login.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: content(),
      backgroundColor: Color.fromARGB(255, 229, 190, 236),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 42, 47, 79),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_2,
                color: Color.fromARGB(255, 229, 190, 236),
                size: 30.0,
              ),
              SizedBox(width: 10),
              Text(
                '𝓟𝓻𝓸𝓯𝓲𝓵𝓮 ',
                style: TextStyle(
                  fontSize: 50, 
                  fontWeight: FontWeight.normal, 
                  color: Colors.white),
              ),
              SizedBox(width: 10),
               Icon(
                Icons.person_2,
                color: Color.fromARGB(255, 229, 190, 236),
                size: 30.0,
              )
            ]
            ),
        ),
         Image.asset(
                "assets/todologo.png",
                width: 200,
                height: 200,
              ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.all(0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 5,),
              Icon(Icons.person,size: 20),
              SizedBox(width: 10,),
              Text("Name: ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 5,),
              Text("OMKAR KADAM",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          )),
          SizedBox(height: 40,),
          Padding(
          padding: EdgeInsets.all(0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment,
            children: [
              SizedBox(width: 5,),
              Icon(Icons.mail,size: 20),
              SizedBox(width: 10,),
              Text("Email: ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 5,),
              Text("omkarskadam20@gmail.com",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          )),
        SizedBox(height: 40),
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
               Get.to(()=>const Login());
            },
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
