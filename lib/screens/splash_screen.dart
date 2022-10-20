import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ms_global_task1/screens/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/logo.jfif"),

        ),
      ),
    );
  }
}
