import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myteethpractice/screens/auth/Authservice.dart';
import 'package:myteethpractice/screens/auth/authscreen.dart';
import 'package:myteethpractice/screens/home/homescreen.dart';
import 'package:myteethpractice/screens/splashscreen_waiting.dart';

import '../main.dart';

class splashscrrenomtro extends StatefulWidget {
  final AuthService authService;
  splashscrrenomtro({Key? key, required this.authService}) : super(key: key);

  @override
  State<splashscrrenomtro> createState() => _splashscrrenomtroState();
}

class _splashscrrenomtroState extends State<splashscrrenomtro>
    with TickerProviderStateMixin {
  late AnimationController? _controller;
  late Animation<double>? animation;

  final linearGradient = LinearGradient(
    colors: [Color.fromRGBO(28, 112, 168, 4), Color.fromRGBO(2, 166, 138, 3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: _controller!,
      curve: Interval(0.0, 0.5, curve: Curves.easeInCubic), // Top motion
    ).drive(Tween(begin: -1.0, end: 1.0));

    _controller!.forward();

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('animatio0nm started');
        widget.authService.splashScreenTimingUp();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(
                  28, 112, 168, 1.0), // Adjust the alpha value to 1.0
              Color.fromRGBO(2, 166, 138, 1.0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
            child: ClipOval(
          child: RotationTransition(
            turns: animation!,
            child: Image.asset(
              'assets/images/dental_images_1.jpg',
              width: 200,
              height: 200,
            ),
          ),
        )),
      ),
    );
  }
}
