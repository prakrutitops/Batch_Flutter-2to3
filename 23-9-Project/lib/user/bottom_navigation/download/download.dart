import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../category/CategoryModel.dart';
import '../../category/categoryDB.dart';

class DownloadScreen extends StatefulWidget
{
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen>
{
  late DB db;
  List<CategoryModel> data = [];
  bool fetchingData = true;

  @override
  void initState() {
    // TODO: implement initState

    db = DB();

  }

  Future<void>getdata()async
  {
        data = await db.getData();

        Timer(
            Duration(seconds: 1),
                () => setState(() {
              fetchingData = false;
            }));
  }


  @override
  Widget build(BuildContext context)
  {
    var size = MediaQuery.of(context).size;

    void deleteCategory(int index) {
      db.deleteData(data[index].id!);
      setState(() {
        data.removeAt(index);
      });
    }

    return Scaffold
      (
      //appBar: AppBar(backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.white,
    body: FutureBuilder
       (
          future: getdata(),
          builder: (context, snapshot)
          {
            return data.length == 0 ?
            fetchingData == true ?
            Center(child: CircularProgressIndicator()) :
            Center(
                child: Column(children:
                [
                  SizedBox(height: size.height * 40 / 100),
                  Text("Downloaded Images Empty".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontStyle: FontStyle.italic))
                ])):
                fetchingData == true ?
                Center(child: CircularProgressIndicator()):
                GridView.count
                  (
                    padding: EdgeInsets.all(6),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 7,
                    crossAxisCount: 2,
                    children:List.generate(data.length, (index)
                    {
                       final url = data[index];
                       return Column
                      (
                      children:
                      [
                        SizedBox(height: 10),
                        Image.file
                        (
                          File(url.url),
                          fit: BoxFit.cover,
                          height: size.height * 17.2 / 100,
                          width: double.infinity,
                          errorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                          return SizedBox(
                          height: size.height * 17.2 / 100,
                          child: Center(
                          child: Icon(
                          Icons.error,
                          size: 40,
                          color: Colors.white,
                          ),
                          ),
                          );
                          }
                        ),
                        Container
                        (
                        height: size.height * 5 / 100,
                        width: double.infinity,
                        decoration: BoxDecoration
                        (
                         color: Colors.blueGrey,
                        ),
                        child: ElevatedButton(
                        onPressed: ()
                        {
                        showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: Row(
                        children: [
                        Icon(
                        Icons.delete,
                        color: Colors.black,
                        ),
                        Text(
                        "\tDelete",
                        style:
                        TextStyle(color: Colors.black),
                        )
                        ],
                        ),
                        content: Text(
                        "This image will be permanently deleted.",
                        style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black)),
                        actions: <Widget>[
                        ElevatedButton(
                        onPressed: () {
                        Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel",
                        style: TextStyle(
                        color: Colors.black)),
                        ),
                        ElevatedButton(
                        onPressed: () {
                        deleteCategory(index);
                        Navigator.of(context).pop();
                        },
                        child: Text("Delete",
                        style: TextStyle(
                        color: Colors.black)),
                        ),
                        ],
                        ),
                        );

                        },
                    child: Text("Delete".toUpperCase(),
                    style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic)),
                    )




                        )]
                      );


                    }



                  ));
          },
       )
      );
  }
}
