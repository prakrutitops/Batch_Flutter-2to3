import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  String dropdownvalue = 'Item 1';
  var items =
  [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("DropDown Example"),),
        body: Center
          (
            child: DropdownButton
              (
              value: dropdownvalue,
              items:items.map((String items)
              {
                return DropdownMenuItem
                  (

                    value: items,
                    child: Text(items),

                  );
                }).toList(),
                  onChanged: (String? newvalue)
                  {
                    setState(()
                    {
                      dropdownvalue = newvalue!;
                    });
                  },

              ),
          ),
      );
  }
}
