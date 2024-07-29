import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabData extends StatefulWidget
{
  const TabData({super.key});

  @override
  State<TabData> createState() => _TabDataState();
}

class _TabDataState extends State<TabData>
{
  @override
  Widget build(BuildContext context)
  {

    return DefaultTabController(length: 3,
        child: Scaffold
          (
            appBar: new AppBar
            (
                title: new Text("TabBar Widget"),
                bottom: new TabBar(
                tabs: <Widget>
              [
                  Tab(icon: Icon(Icons.cake)),
                  Tab(icon: Icon(Icons.android)),
                  Tab(icon: Icon(Icons.phone_android)),
              ],
          ),
          )
        ));

  }
}
