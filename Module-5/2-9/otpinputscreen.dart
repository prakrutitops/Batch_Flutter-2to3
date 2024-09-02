import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OTPInputScreen extends StatefulWidget
{
  String verificationId;

  OTPInputScreen({required this.verificationId});

  @override
  State<OTPInputScreen> createState() => _OTPInputScreenState();
}

class _OTPInputScreenState extends State<OTPInputScreen>
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otp1 = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("OTP INPUT"),),
        body: Center
          (


              child: Padding
                (
                  padding: const EdgeInsets.all(8.0),
                  child: Column
                    (
                      children:
                      [

                        TextField
                          (
                            controller: otp1,
                            decoration: InputDecoration
                              (
                                hintText: "Enter OTP"
                              ),

                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: () async
                          {
                                String a = otp1.text.toString();
                                await signInWithPhoneNumber(a);
                          }, child: Text("Verify"))

                      ],
                    ),
                // child: TextField
                //   (
                //     controller: otp1,
                //     decoration: InputDecoration
                //       (
                //         hintText: "Enter OTP"
                //       ),
                //
                //   ),
              ),
          ),
      );
  }

  Future<void> signInWithPhoneNumber(String a) async
  {

    try {
      final AuthCredential credential = PhoneAuthProvider.credential
        (
        verificationId: widget.verificationId,
        smsCode: a,
      );
      await _auth.signInWithCredential(credential);
      // TODO: Navigate to another screen upon successful verification
    }
    catch (e)
    {
      print(e.toString());
    }

  }
}
