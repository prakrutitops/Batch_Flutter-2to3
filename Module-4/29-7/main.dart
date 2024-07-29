import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ttsex/tablayout.dart';

void main()
{
  runApp(MaterialApp(home:TabData()));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  TextEditingController data = TextEditingController();
  late FlutterTts flutterTts=FlutterTts();
  String mydata="";
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Text to Speech"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                  TextField(controller:data,decoration: InputDecoration(hintText: "Enter Data"),),
                  ElevatedButton(onPressed: ()
                  {
                       mydata = data.text.toString();
                      _speak();

                  }, child: Text("Speak"))
                ],
              ),
          ),
      );
  }

  Future<void> _speak() async
  {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.6);
    await flutterTts.setPitch(0.6);

    if (mydata != null)
    {
      if (mydata!.isNotEmpty)
      {
        print("1");
        await flutterTts.speak(mydata!);
        print("2");
      }
    }
  }
}


