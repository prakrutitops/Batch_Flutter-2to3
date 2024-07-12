import 'package:flutter/material.dart';
import 'package:untitled/screens/home/home_screen.dart';
import 'constants.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      title: "E-Commerce Design",
      theme: ThemeData
        (
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      home: HomeScreen(),
      );
  }

}
