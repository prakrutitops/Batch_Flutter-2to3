import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'loadinglist.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title:Text("Shimmer Effect Example"),),
        body: Center
          (
                child: ElevatedButton(onPressed: ()
                {

                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoadingListPage()));

                }, child:Text("Show Effect"),),
          ),
      );
  }
}
