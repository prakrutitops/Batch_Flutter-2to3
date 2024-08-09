import 'package:flutter/material.dart';
import 'package:modelex/dbhelper.dart';

import 'note.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  late String t,d;
  DatabaseHelper databaseHelper = DatabaseHelper();
  late Note note=Note();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Center
          (

            child: Column
              (
                children:
                [

                    TextField(controller:title,decoration: InputDecoration(hintText: "Enter title"),),
                    TextField(controller:des,decoration: InputDecoration(hintText: "Enter Description")),
                    ElevatedButton(onPressed: ()
                    {
                        t= title.text.toString();
                        d= des.text.toString();

                        //set
                        note.title=t;
                        note.description=d;

                        databaseHelper.insertNote(note);
                        print("Inserted");


                    }, child: Text("Save")),

                ],
              ),
          ),
      );
  }
}
