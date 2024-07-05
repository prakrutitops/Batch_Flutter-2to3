import 'package:flutter/material.dart';

class CheckboxEx extends StatefulWidget {
  const CheckboxEx({super.key});

  @override
  State<CheckboxEx> createState() => _CheckboxExState();
}

class _CheckboxExState extends State<CheckboxEx> {
  bool firstvalue = false;
  bool secondvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox Example"),
      ),
      body: Center(
        child: Column(
          children: [
            CheckboxListTile(
                title: Text("Click 1"),
                subtitle: Text("SubClick 1"),
                secondary: Icon(Icons.add),
                value: firstvalue,
                onChanged: (value) {
                  print("Before :$firstvalue");

                  setState(() {
                    this.firstvalue = value!;
                  });
                  print("After: $firstvalue");
                }),
            CheckboxListTile(
                title: Text("Click 2"),
                subtitle: Text("SubClick 2"),
                secondary: Icon(Icons.add),
                value: secondvalue,
                onChanged: (value) {
                  setState(() {
                    this.secondvalue = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
