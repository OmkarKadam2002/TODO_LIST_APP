import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todoapp/home_controller.dart';
import 'package:todoapp/profile_screen.dart';
import 'package:todoapp/task_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(Homecontroller());
    
    var navbaritem = [
      BottomNavigationBarItem(icon: Icon(Icons.list, size:20),label: 'Tasks' ),
      BottomNavigationBarItem(icon: Icon(Icons.list, size:20),label: 'Profile' )
      ];
    
    var navbody =[
      Taskscreen(),
      Profilescreen(),
      ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:[
          Obx(()=>Expanded(child: navbody.elementAt(controller.navcurrentindex.value)),)
          ]),
      bottomNavigationBar: Obx(
        ()=>
        BottomNavigationBar(
        currentIndex: controller.navcurrentindex.value,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontFamily: 'sans_semibold'),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 42, 47, 79),
        items:navbaritem,
        onTap: (value){
          controller.navcurrentindex.value=value;
        },
        ),)
    );
  }
}