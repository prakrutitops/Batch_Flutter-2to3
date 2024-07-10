import 'dart:math';

import 'package:flutter/material.dart';

class RandomNum extends StatefulWidget
{
  const RandomNum({super.key});

  @override
  State<RandomNum> createState() => _RandomNumState();
}

class _RandomNumState extends State<RandomNum> {

  TextEditingController num = TextEditingController();
  int _randomNumber = 0;
  String _message = '';
  bool _showResult = false;
  //
  @override
  void initState()
  {
    // TODO: implement initState
   // super.initState();
    _randomnum();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Random Number Guessing"),),
      body: Container
        (
          margin: EdgeInsets.all(16.0),
          child: Column
            (
              children:
              [
                if (_showResult)//true
                  Text
                    (
                      _message,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  SizedBox(width: 20,height: 20,),
                  TextField(controller: num,decoration: InputDecoration(hintText: "Enter Your Number"),),
                  SizedBox(width: 20,height: 20,),
                  ElevatedButton(onPressed: (){_guess();}, child: Text("Guess")),
                  ElevatedButton(onPressed:(){_reset();}, child: Text("Reset"))
              ],
            ),
        ),
    );
  }

  void _guess()
  {
    String mynum = num.text.toString();
    int mynum2 = int.parse(mynum);
    if(mynum2!=null)
    {
      setState(()
      {
        if(mynum2 == _randomNumber)
        {
          _message = 'Congratulations! You guessed the number $_randomNumber!';
        }
        else if (mynum2 < _randomNumber)
        {
          _message = 'Try higher!';
        }
        else
        {
          _message = 'Try lower!';
        }

        _showResult = true;
      });
    }
  }

  void _reset()
  {
    setState(() {
      num.clear();
      _randomnum();
      _message = '';
      _showResult = false;
    });
  }

  void _randomnum()
  {
    final random = Random();
    _randomNumber = random.nextInt(10) + 1;
  }
}
