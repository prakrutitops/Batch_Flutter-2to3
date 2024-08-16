import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'myanimation.dart';

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
  late List<Model>list;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Api Calling"),),
        body: FutureBuilder
          (
            future: fetchdata(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
            {
                if(snapshot.hasData)
                {
                  return Model(list:snapshot.data);
                }
                if(snapshot.hasError)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet is not connected")));
                }

                return MyAnimation();
            },

          ),
      );
  }

  fetchdata()async
  {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
