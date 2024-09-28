import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../user/login/login.dart';
import '../bottom_navigation/home/home.dart';
import '../bottom_navigation/upload/upload.dart';

class AdminDasboardScreen extends StatefulWidget
{
  const AdminDasboardScreen({super.key});

  @override
  State<AdminDasboardScreen> createState() => _AdminDasboardScreenState();
}

class _AdminDasboardScreenState extends State<AdminDasboardScreen> {

  late SharedPreferences sharedPreferences;
  String mynum = "";

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>
  [
    AdminHome(),
    AdminUpload(),
  ];

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState()
  {
    // TODO: implement initState
   // super.initState();
    checkdata();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar
          (

          automaticallyImplyLeading: false,
          backgroundColor: kBrown,
          title: Text("Admin Dashboard",style: TextStyle(color: Colors.white),),
            actions:
            [
              IconButton(onPressed: ()
              {
                sharedPreferences.setBool("admin", true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

              }, icon: Icon(Icons.logout,color: Colors.white,))
          ],
          ),
      body: Center
        (
         child: _widgetOptions.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
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
