import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jsonex123/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'insertdata.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
class DashboardPage extends StatefulWidget
{
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
{
  late SharedPreferences sharedPreferences;
  late String email;
  late List list;

  @override
  void initState()
  {
    initial();
  }

  void initial()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString('myemail')!;
    });
    getdata();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Welocme $email"),
          actions:
        [
            IconButton(onPressed: ()
            {
              sharedPreferences.setBool('tops', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));

            }, icon: Icon(Icons.logout))
        ],),
        body: FutureBuilder
          (
              future: getdata(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
              {
                if(snapshot.hasData)
                {
                  return Model(list:snapshot.data);
                }

                  if(snapshot.hasError)
                  {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data can not be fetched")));
                  }


                  return CircularProgressIndicator();

              },

          ),

        floatingActionButton: FloatingActionButton
          (
          onPressed: ()
          {
              Navigator.push(context,MaterialPageRoute(builder: (context) => InsertData()));
          },

          child: Icon(Icons.add),
          ),

      );
  }

  getdata()async
  {

      var url = Uri.parse("https://topstech8.000webhostapp.com/MYAPI/view.php");
      var response = await http.get(url);
      return jsonDecode(response.body);
  }
}
