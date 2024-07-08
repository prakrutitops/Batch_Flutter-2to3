import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {

  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview Example"),
      ),
      body:
    GridView.builder
    (
          itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0

          ),
          itemBuilder: (BuildContext context, int index)
          {
            return Image.network(images[index]);
          },

    ));
  }
}
