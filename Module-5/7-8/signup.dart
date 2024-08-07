import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex123/main.dart';

class SignupPage extends StatefulWidget
{
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
{

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late String f,l,e,p;
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

            TextFormField(controller:fname,decoration: InputDecoration(hintText: "Enter Firstname", enabledBorder: OutlineInputBorder
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
                    borderRadius: BorderRadius.circular(10))),),
            SizedBox(height: 10,),
            TextFormField(controller:lname,decoration: InputDecoration(hintText: "Enter Lastname", enabledBorder: OutlineInputBorder
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
                 f = fname.text.toString();
                 l = lname.text.toString();
                 e = email.text.toString();
                 p = pass.text.toString();

                 print("$f,$l,$e,$p");

                insertdata();


            }, child: Text("Signup")),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => SignupPage()));

            }, child: Text("Login?"))

          ],
        ),
      ),
    );
  }

  void insertdata()
  {
    var url = Uri.parse("https://topstech8.000webhostapp.com/MYAPI/signup.php");
    http.post(url, body:
        {
          "fname":f,
          "lname":l,
          "email":e,
          "password":p,

        });
    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
  }
}