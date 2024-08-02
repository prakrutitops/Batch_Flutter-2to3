import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';
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

class _MyAppState extends State<MyApp> {

    getdata()async
    {
      var url = Uri.parse("https://topstech8.000webhostapp.com/API_Demo_Morning/view.php");
      var resp = await http.get(url);
      return jsonDecode(resp.body);
    }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Display Data"),),
        body: FutureBuilder
          (
            future: getdata(),

            builder: (BuildContext context, AsyncSnapshot<dynamic?> snapshot)
            {
              if(snapshot.hasError)
                  {
                    print("Network not found");
                  }
                  if(snapshot.hasData)
                  {
                      return Model(list:snapshot.data);
                  }

                  return CircularProgressIndicator();
            },

            // builder: (context,snapshot)
            // {
            //     if(snapshot.hasError)
            //     {
            //       print("Network not found");
            //     }
            //     if(snapshot.hasData)
            //     {
            //         return Model(list:snapshot.data);
            //     }
            //
            //     return CircularProgressIndicator();
            // },

          ),
      );
  }
}

