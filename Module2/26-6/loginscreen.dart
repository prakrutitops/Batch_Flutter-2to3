import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboadrScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    checkdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Login Page"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Enter Your Emailid",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Proper Email id';
                      }
                      return null;
                    },
                  ),
                  //Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: password,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Proper Password';
                        }
                        return null;
                      }),

                  //Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        String data = email.text.toString();
                        String data2 = password.text.toString();

                        if (_formKey.currentState!.validate()) {
                          if (data == "admin@gmail.com" && data2 == "1234") {
                            print("my data is $data and $data2");
                            print("successfully login");
                            sharedPreferences.setBool("mylogin", false);
                            sharedPreferences.setString("myemail", data);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()));
                          } else {
                            //print("fail");
                            // SnackBar snackbar =
                            //     SnackBar(content: Text("Login Fail"));
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(snackbar);
                            Fluttertoast.showToast(
                              msg: "Login Fail",
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 1,
                            );
                          }
                        } else {
                          // SnackBar snackbar =
                          //     SnackBar(content: Text("Login Fail"));
                          // ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          Fluttertoast.showToast(
                            msg: "Login Fail",
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 1,
                          );
                        }
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ),
        ));
  }

  void checkdata() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool('mylogin') ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }
}
