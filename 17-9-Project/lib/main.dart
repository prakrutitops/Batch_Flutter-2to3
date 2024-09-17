import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login/login.dart';

void main()async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

 // runApp(MaterialApp(home:SplashScreen(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget
{

  final Future<FirebaseApp> _initailization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder(
        future: _initailization,
        builder: (context, snapshot) {
          //Something from Firebase
          if (snapshot.hasError) {
            print('Something Went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                ),
              ),
              home: SplashScreen(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    Timer(Duration(seconds: 3),
            () => Navigator.pushReplacement
              (
                context, MaterialPageRoute(builder: (context) => LoginScreen()
              )));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body: Center
          (
            child:  Lottie.asset('assets/anim.json'),
          ),
      );
  }
}


