import 'package:flutter/material.dart';

class SelectionAlert extends StatefulWidget {
  const SelectionAlert({super.key});

  @override
  State<SelectionAlert> createState() => _SelectionAlertState();
}

enum ConfirmAction { Cancel, Accept }

enum Product { Apple, Samsung, Oppo, Redmi }

class _SelectionAlertState extends State<SelectionAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialogs"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  selectiondialog();
                },
                child: Text("Selection Dialog")),
            ElevatedButton(
                onPressed: () {
                  confirmdialog();
                },
                child: Text("Confirmation Dialog")),
            ElevatedButton(
                onPressed: () {
                  textdialog();
                },
                child: Text("Text Dialog")),
            ElevatedButton(
                onPressed: () {
                  alertdialog();
                },
                child: Text("Alert Dialog")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("clicked");
          },
          child: Icon(Icons.add)),
    );
  }

  void selectiondialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Apple);
                },
                child: const Text('Apple'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Samsung);
                },
                child: const Text('Samsung'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Oppo);
                },
                child: const Text('Oppo'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Product.Redmi);
                },
                child: const Text('Redmi'),
              ),
            ],
          );
        });
  }

  void confirmdialog() {
    AlertDialog alertDialog = AlertDialog(
      title: Text("Delete Contact"),
      content: Text("Are you sure you want to delete?"),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(ConfirmAction.Cancel);
          },
        ),
        ElevatedButton(
          child: const Text('Delete'),
          onPressed: () {
            Navigator.of(context).pop(ConfirmAction.Accept);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void textdialog() {
    Widget okbtn = ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("OK"));
    AlertDialog alertDialog = AlertDialog(
      title: Text("This is simple alert"),
      content:
          TextField(decoration: InputDecoration(hintText: "Enter Your name")),
      actions: [okbtn],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void alertdialog() {
    Widget okbtn = ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("OK"));
    AlertDialog alertDialog = AlertDialog(
      title: Text("This is simple alert"),
      content: Text("Alert Data"),
      actions: [okbtn],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
