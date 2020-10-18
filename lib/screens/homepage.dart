import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Card(
                  color: Color(0xFFD69E6B),
                  shape: CircleBorder(),
                  child: InkWell(
                    splashColor: Color(0xFF00223A),
                    onTap: () {},
                    child: Center(
                      child: Text(
                        "سبحان الله",
                        style: TextStyle(
                          fontFamily: 'Islami',
                          fontSize: 45,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('4:النتيجة',style: TextStyle(
              fontFamily: 'Lemonada',
              fontSize: 45,
            ),),
          ],
        ),
      ),
    );
  }
}
