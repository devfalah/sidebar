import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  StreamController<bool> isSideBarOpenStreamController;
  Stream<bool> isSideBarStream;
  StreamSink<bool> isSideBarOpenSink;
  AnimationController _animationController;
  final bool isSideBarOpen = false;
  final _animationDurationn = const Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDurationn);
    isSideBarOpenStreamController = PublishSubject<bool>();
    isSideBarStream = isSideBarOpenStreamController.stream;
    isSideBarOpenSink = isSideBarOpenStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSideBarOpenStreamController.close();
    isSideBarOpenSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSideBarOpenSink.add(false);
      _animationController.reverse();
    } else {
      isSideBarOpenSink.add(true);

      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        initialData: false,
        stream: isSideBarStream,
        builder: (context, isSideBarOpnedAsync) {
          return AnimatedPositioned(
            duration: _animationDurationn,
            top: 0,
            bottom: 0,
            left: isSideBarOpnedAsync.data ? 0 : -screenWidth,
            right: isSideBarOpnedAsync.data ? 0 : screenWidth - 45,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Color(0xFF00223A),
                    child: Column(
                      children: [
                        SizedBox(height: 100.0),
                        Text("التسابيح",style:TextStyle(
                          fontFamily: 'Lemonada',
                          color: Color(0xFFD69E6B),
                        ),),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Color(0xFFD69E6B),
                          endIndent: 32,
                          indent: 32,
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      onIconPressed();
                    },
                    child: ClipPath(
                      clipper: CustomMenuClipper(),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: Color(0xFF00223A),
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Color(0xFFD69E6B),
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    Path path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width +1, height / 2 + 20, 10, height-16);
    path.quadraticBezierTo( 0, height -8, 0, height);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
