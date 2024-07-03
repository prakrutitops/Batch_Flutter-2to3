import 'package:flutter/material.dart';

import 'navigation.dart';

void main() {
  runApp(MaterialApp(
    home: MyNavigation(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('About Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Add Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Camera Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        iconSize: 36.0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        //type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        elevation: 5,
        onTap: _mytapmethod,
        items: [
          BottomNavigationBarItem(
              label: "About", icon: Icon(Icons.account_box_outlined)),
          BottomNavigationBarItem(label: "Add", icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: "Camera", icon: Icon(Icons.camera)),
        ],
      ),
    );
  }

  _mytapmethod(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
