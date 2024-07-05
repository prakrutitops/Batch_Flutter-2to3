import 'package:flutter/material.dart';

class RadioButtonEx extends StatefulWidget {
  const RadioButtonEx({super.key});

  @override
  State<RadioButtonEx> createState() => _RadioButtonExState();
}

enum genderselection { male, female }

class _RadioButtonExState extends State<RadioButtonEx> {
  genderselection _gender = genderselection.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RadioButton Example"),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text("Male"),
              leading: Radio(
                value: genderselection.male,
                groupValue: _gender,
                onChanged: (genderselection? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Female"),
              leading: Radio(
                value: genderselection.female,
                groupValue: _gender,
                onChanged: (genderselection? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
