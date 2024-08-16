import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAnimation extends StatelessWidget
{
  const MyAnimation({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Center
          (
              child: Lottie.asset('assets/myanim.json'),
          ),
      );
  }
}
