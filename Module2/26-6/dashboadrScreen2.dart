import 'package:flutter/material.dart';
import 'package:secondproject/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen2 extends StatefulWidget {
  String data;
  DashboardScreen2({required this.data});

  @override
  State<DashboardScreen2> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<DashboardScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("${widget.data}"),
      ),
    );
  }
}
