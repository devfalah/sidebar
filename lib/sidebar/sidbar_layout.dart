import 'package:flutter/material.dart';
import 'package:tasbeh/screens/homepage.dart';
import 'package:tasbeh/sidebar/sidebar.dart';
class SideBarLayout extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
        children:[
          HomePage(),
          SideBar(),

        ],
      ),
    );
  }
}