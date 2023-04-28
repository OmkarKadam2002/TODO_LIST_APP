import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/login.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  changeScreen(){
    Future.delayed(const Duration(seconds:5),(){
      Get.to(()=>const Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color.fromARGB(255, 229, 190, 236),
        child: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/todologo.png",
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              const Text(
                // ignore: misspelled_identifier
                '𝓛𝓲𝓼𝓽𝓲𝓯𝔂',
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 42, 47, 79)),
              ),
            ],
          ),
        )));
  }
}