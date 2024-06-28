import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    checkconnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset('images/animation.json')),
      //Image.asset("images/cafe.png")),
    );
  }

  void checkconnection() async {
    var connectionresult = await Connectivity().checkConnectivity();
    if (connectionresult == ConnectivityResult.mobile) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    } else if (connectionresult == ConnectivityResult.wifi) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    } else {
      showdialogerror();
    }
  }

  void showdialogerror() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: Row(
              children: [Icon(Icons.error), Text("\tNetwork Error")],
            ),
            content: Text('Please check your internet connection.',
                style: TextStyle(fontStyle: FontStyle.italic)),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text("Exit"))
            ],
          );
        });
  }
}
