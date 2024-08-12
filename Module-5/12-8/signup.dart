import 'dart:convert';

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

  /*

    var uri = Uri. http('example. org', '/ path', { 'q' : 'dart' });
  print(uri); // http:// example. org/ path?q=dart

uri = Uri. http('user:password@localhost:8080', '');
print(uri); // http:// user:password@localhost:8080

uri = Uri. http('example. org', 'a b');
print(uri); // http:// example. org/ a%20b

uri = Uri. http('example. org', '/ a%2F');
print(uri); // http:// example. org/ a%252F

   */
  void insertdata()async
  {
    // var uri = Uri.http('www.prakrutitops.byethost17.com', '/signup.php');
    // print(uri); // http:// example. org/ path?q=dart



      var uri = Uri.http('www.prakrutitops.byethost17.com', '/signup.php');
      print(uri);
      var response = await http.post(uri, body: {'fname': f, 'lname': l, 'email': e, 'password':p});
      print("My Data: $response");
      //print(response.body.toString());

      // if (response.statusCode == 200)
      // {
      //   // Handle the response
      //   print("a");
      //   var data = json.decode(response.body.toString());
      //   print('Response data: $data');
      //   //print('Response data: ${response.body}');
      // }
      // else
      // {
      //   // Handle error response
      //   print("b");
      //   print('Error: ${response.statusCode}');
      // }
     // var message = '${response.body.tos}';

      //print(message);

      // http.post(uri, body:
      //   {
      //     "fname":f,
      //     "lname":l,
      //     "email":e,
      //     "password":p,
      //
      //   });
     // Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage()));
  }
}