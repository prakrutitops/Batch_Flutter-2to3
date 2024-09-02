import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'otpinputscreen.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
              home: OTPScreen(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
class OTPScreen extends StatefulWidget
{
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
{
  TextEditingController num = TextEditingController();
  late String _verificationId;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("OTP Verification"),),
        body: Center
          (
            child: Column
              (
                children:
                [

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField
                        (
                        controller: num,
                          decoration: InputDecoration(hintText: "Enter Your Phone Number"),
                        ),
                    ),
                    SizedBox(height:10),
                    ElevatedButton(onPressed: ()
                    {
                      verifyPhoneNumber(num.text.toString());
                    }, child: Text("GET OTP"))

                ],
              ),
          ),
      );
  }

  Future<void> verifyPhoneNumber(String number)async
  {
    await FirebaseAuth.instance.verifyPhoneNumber
      (
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async
        {
          await FirebaseAuth.instance.signInWithCredential(credential);
          // Navigate to next screen upon successful verification
          print('Verification completed, auto-signed in');
        },
        verificationFailed: (FirebaseAuthException e)
        {
          // Handle verification failure
          print('Failed to verify phone number: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
          });
          // Navigate to OTP input screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPInputScreen(verificationId: verificationId),
            ),
          );
        },
      codeAutoRetrievalTimeout: (String verificationId)
      {
        // Handle timeout
      },
      );


  }
}

