import 'package:flutter/material.dart';
import 'package:secondproject/dashboadrScreen2.dart';
import 'package:secondproject/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late SharedPreferences sharedPreferences;
  late String myusername;
  TextEditingController data = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $myusername"),
        actions: [
          IconButton(
              onPressed: () {
                sharedPreferences.setBool("mylogin", true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: data,
              decoration: InputDecoration(hintText: "Enter Data"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  String a = data.text.toString();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen2(data: a)));
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      myusername = sharedPreferences.getString("myemail")!;
    });
  }
}
