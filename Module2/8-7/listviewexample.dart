import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Example"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("A1"),
                  subtitle: Text("Abc1"),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("A1"),
                  subtitle: Text("Abc1"),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("A1"),
                  subtitle: Text("Abc1"),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("A1"),
                  subtitle: Text("Abc1"),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("A1"),
                  subtitle: Text("Abc1"),
                ),
              ],
            );
            // return ListTile(
            //   leading: Icon(Icons.add),
            //   title: Text("A"),
            //   subtitle: Text("Abc"),
            // );
          }),
    );
  }
}
