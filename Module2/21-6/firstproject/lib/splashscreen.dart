import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboardscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SplashScreen"),
      ),
      body: Center(
          child: Column(
        children: [
          Image.network(
              "https://marketplace.canva.com/EAFLU7Mm3FI/1/0/1600w/canva-brown-and-beige-simple-minimalist-coffee-shop-circle-logo-ww1u6OsW_3o.jpg"),
          ElevatedButton(
              onPressed: () {
                Timer(
                    Duration(seconds: 3),
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen())));
              },
              child: Text("Click Here to Proceed"))
        ],
      )),
    );
  }
}
