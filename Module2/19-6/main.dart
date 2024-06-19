import 'package:firstproject/third.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SecondScreen(),
  ));
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tops Technologies"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("Nirmal"),
          Text("Jay"),
          // Image.network
          //   (
          //   "https://yt3.googleusercontent.com/tWt6Z524G85N6RuHk2IHy05wso5CZ3YA2uK7Fzs4UO2i815uO_66j2s4aayp0eIj0jSAmCna1w=s900-c-k-c0x00ffffff-no-rj",
          //   width: 250,
          //   height: 250,
          //   ),
          //Image.asset("images/a.jpg", width: 250, height: 250),
          ElevatedButton(
              onPressed: () {
                print("welcome");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()));
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}
