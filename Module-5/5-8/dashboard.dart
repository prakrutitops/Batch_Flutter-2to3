import 'package:flutter/material.dart';
import 'package:jsonex123/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'insertdata.dart';

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
}
