import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project9/user/login/widgets/custom_clippers/brown_top_clipper.dart';
import 'package:project9/user/login/widgets/custom_clippers/gold_top_clipper.dart';
import 'package:project9/user/login/widgets/custom_clippers/lightgold_top_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../admin/adminfront/admindashbaord.dart';
import '../../constants.dart';
import '../dashboard/dashboard_screen.dart';
import '../register/register/register.dart';
import '../register/register/widgets/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var username = TextEditingController();
  var password = TextEditingController();
  var mobileno = TextEditingController();
  bool _isObscurePassword = true;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  late SharedPreferences sharedPreferences;
  late bool newuser,newuser2;

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();

    checkConnection();
    checkValue();
  }

  void checklogin() async {
    var url = Uri.parse("https://prakrutitech.buzz/Project_API/login.php");
    var response = await http.post(url, body: {
      "mobileno": mobileno.text.toString(),
      "password": password.text.toString()
    });
    var data = json.decode(response.body);

    if (data == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Fail")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Success")));

      sharedPreferences.setBool('tops', false);
      sharedPreferences.setString('mymob', mobileno.text.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DasboardScreen()));
    }
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else {
      _showConnectionDialog();
    }
  }

  void _showConnectionDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: Row(
            children: [Icon(Icons.error), Text("\tNetwork Error")],
          ),
          content: Text('Please check your internet connection.',
              style: TextStyle(fontStyle: FontStyle.italic)),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: Text("Exit", style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: kLightGold,
        body: Stack(
          children: [
            ClipPath(
              clipper: const GoldTopClipper(),
              child: Container(color: kGold),
            ),
            ClipPath(
              clipper: const BrownTopClipper(),
              child: Container(color: kBrown),
            ),
            ClipPath(
              clipper: const LightGoldTopClipper(),
              child: Container(color: kLightGold),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                child: Column(
                  children: [
                    Header(),
                    //Spacer(),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPaddingL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: space * 7),

                          Text(
                            'Login here using your username and password.',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: kDarkBrown.withOpacity(0.7)),
                          ),

                          SizedBox(height: space - 5),

                          TextField(
                            controller: mobileno,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ),

                          SizedBox(height: space - 7),

                          TextField(
                            controller: password,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  if (mobileno.text.isEmpty) {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        'Please Enter Mobile Number',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else if (mobileno.text.length != 10) {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        'Invalid Mobile Number',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else if (password.text.isEmpty) {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        'Please Enter Password',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }

                                  setState(() {
                                    _isObscurePassword = !_isObscurePassword;
                                  });
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                            obscureText: _isObscurePassword,
                          ),

                          //SizedBox(height: space-7),

                          // TextField(
                          //   controller: mobileno,
                          //   keyboardType: TextInputType.phone,
                          //   decoration: InputDecoration(
                          //     contentPadding: const EdgeInsets.all(kPaddingS),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                          //     ),
                          //     hintText: 'Mobile Number',
                          //     hintStyle: TextStyle(
                          //       color: kBlack.withOpacity(0.5),
                          //       fontWeight: FontWeight.w500,
                          //     ),
                          //     prefixIcon: Icon(
                          //       Icons.phone,
                          //       color: kBlack.withOpacity(0.5),
                          //     ),
                          //   ),
                          // ),

                          SizedBox(height: space - 7),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kDarkBrown,
                                padding: const EdgeInsets.all(kPaddingS + 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: ()
                              {


                                if(mobileno.text.toString()=="1234567890" && password.text.toString()=="1")
                                {
                                  sharedPreferences.setBool('admin', false);
                                  sharedPreferences.setString('mymob', mobileno.text.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDasboardScreen()));
                                }
                                else
                                {
                                  checklogin();
                                }

                              },
                              child: Text(
                                "Login to continue",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: kGold,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          SizedBox(height: space),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kGold,
                                padding: const EdgeInsets.all(kPaddingS + 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                              },
                              child: Text(
                                "Forgot a E-wishes Password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: kDarkBrown,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          //SizedBox(height: 2 * space),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kBrown,
                                padding: const EdgeInsets.all(kPaddingS + 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: Text(
                                "Create an E-wishes Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: kLightGold,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // SizedBox(height: space),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  checkValue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool('tops') ?? true;
    newuser2 = sharedPreferences.getBool('admin') ?? true;

    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DasboardScreen()));
    }
    if (newuser2 == false)
    {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminDasboardScreen()));
    }


  }
}
