import 'package:flutter/material.dart';
import 'package:project9/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navigation/download/download.dart';
import '../bottom_navigation/home/home.dart';
import '../login/login.dart';

class DasboardScreen extends StatefulWidget
{
  @override
  State<DasboardScreen> createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen>
{
  late SharedPreferences sharedPreferences;
   String mynum = "";

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>
  [
    Home(),
    DownloadScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }
  @override
  void initState()
  {
    // TODO: implement initState
    //super.initState();
    checkdata();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(
          title: Text("Welcome $mynum",style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading: false,
          backgroundColor: kBrown,
          actions:
          [
              IconButton(onPressed: ()
              {
                sharedPreferences.setBool("tops", true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

              }, icon: Icon(Icons.logout,color: Colors.white,))
          ],),
        body: Center
          (
          child: _widgetOptions.elementAt(_selectedIndex),
          ),
      backgroundColor: kLightGold,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
            //title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: "Download"
            //title: Text('Download'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kGold,
        backgroundColor: kDarkBrown,
        unselectedItemColor: kTerracotta,
        onTap: _onItemTapped,
      ),
      );
  }

  void checkdata()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(()
    {
      mynum = sharedPreferences.getString("mymob")!;
    });

  }
}
