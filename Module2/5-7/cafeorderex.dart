import 'package:flutter/material.dart';

class CafeOrderEx extends StatefulWidget {
  const CafeOrderEx({super.key});

  @override
  State<CafeOrderEx> createState() => _CafeOrderExState();
}

class _CafeOrderExState extends State<CafeOrderEx> {
  int amount = 0;
  bool pizza = false;
  bool burger = false;
  bool coffee = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cafe Order"),
      ),
      body: Center(
        child: Column(
          children: [
            CheckboxListTile(
                value: pizza,
                title: Text("Pizza @ Rs.100"),
                onChanged: (value) {
                  setState(() {
                    this.pizza = value!;
                    amount += 100;
                  });
                }),
            CheckboxListTile(
                value: burger,
                title: Text("Burger @ Rs.70"),
                onChanged: (value) {
                  setState(() {
                    this.burger = value!;
                    amount += 70;
                  });
                }),
            CheckboxListTile(
                value: coffee,
                title: Text("Coffee @ Rs.120"),
                onChanged: (value) {
                  setState(() {
                    this.coffee = value!;
                    amount += 120;
                  });
                }),
            ElevatedButton(
                onPressed: () {
                  print(amount);
                },
                child: Text("Order"))
          ],
        ),
      ),
    );
  }
}
