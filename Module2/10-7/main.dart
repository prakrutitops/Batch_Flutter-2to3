import 'package:flutter/material.dart';
import 'package:pageviewex/randomnumber.dart';

import 'home.dart';

void main() 
{
  runApp(
   MaterialApp(
  title: 'PageView in Flutter',
  theme: ThemeData
    (
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  debugShowCheckedModeBanner: false,
  home: RandomNum(),
  ));
}
