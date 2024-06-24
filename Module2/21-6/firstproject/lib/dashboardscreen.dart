import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset("images/c1.jpg"),
                Text(
                  "Coffee",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AutofillHints.familyName,
                      fontSize: 20,
                      color: Colors.blue),
                ),
                Text("Price : 150",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.familyName,
                        fontSize: 20,
                        color: Colors.orange)),
                Image.asset("images/p1.jpg"),
                Text("Pizza",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.familyName,
                        fontSize: 20,
                        color: Colors.blue)),
                Text("Price : 120",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.familyName,
                        fontSize: 20,
                        color: Colors.orange)),
                Image.asset("images/p11.jpg"),
                Text("Puff",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.familyName,
                        fontSize: 20,
                        color: Colors.blue)),
                Text("Price : 40",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.familyName,
                        fontSize: 20,
                        color: Colors.orange)),
              ],
            ),
          ),
        ));
  }
}
