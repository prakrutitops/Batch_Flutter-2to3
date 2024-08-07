import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex123/main.dart';
import 'package:jsonex123/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

void main()
{
  runApp(MaterialApp(home:LoginPage()));
}

class LoginPage extends StatefulWidget
{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{


  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late String e,p;
  late SharedPreferences sharedPreferences;
  late bool newuser;

  @override
  void initState()
  {
    // TODO: implement initState
    //super.initState();

    checkLogin();

  }
  void checkLogin()async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('tops')?? true);
    print(newuser);
    if(newuser == false)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
   // super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Json Crud"),),
      body: Padding
        (
        padding: EdgeInsets.all(16.0),
        child: Column
          (
          children:
          [


            TextFormField(controller:email,decoration: InputDecoration(hintText: "Enter Email", enabledBorder: OutlineInputBorder
              (
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),))),
            SizedBox(height: 10,),
            TextFormField(controller:pass,obscureText:true,decoration: InputDecoration(hintText: "Enter Password", enabledBorder: OutlineInputBorder
              (
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),))),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {

              e = email.text.toString();
              p = pass.text.toString();

              print("$e,$p");

              checklogin();


            }, child: Text("Login")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => SignupPage()));
            }, child: Text("Signup?"))

          ],
        ),
      ),
    );
  }

  void checklogin()async
  {
    var url = Uri.parse("https://topstech8.000webhostapp.com/MYAPI/login.php");
    var response = await http.post(url, body:
    {
      "email": e,
      "password": p
    });
    var data = json.decode(response.body);

    if (data == 0)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Fail")));
    }
    else
    {
      sharedPreferences.setBool('tops', false);
      sharedPreferences.setString('myemail',email.text.toString() );
      Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }
}