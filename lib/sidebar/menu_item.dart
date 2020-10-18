import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  MenuItem({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.cyan,
            size: 30.0,
          ),
          SizedBox(width: 30,),
          Text(title),

        ],
      ),
    );
  }
}
