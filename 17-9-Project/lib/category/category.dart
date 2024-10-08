import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import '../../constants.dart';



class Category extends StatefulWidget{
  var index;
  var category_name;
  Category({Key? key, @required this.index, @required this.category_name}) : super(key: key);

  @override
  CategoryPage createState() => CategoryPage(category_id: index,category_nm: category_name);
}

class CategoryPage extends State<Category> {
  var size;

  var category_id;
  var category_nm;
  CategoryPage({Key? key, @required this.category_id, @required this.category_nm});

  Future<List> viewCategoryItemsData() async{

    final responce = await http.get(Uri.parse("https://prakrutitech.buzz/Project_API/category_images_view.php?data="+category_id.toString()));
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context){
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kLightGold,
      appBar: AppBar(
        title: Text("${category_nm}".toUpperCase(),style: TextStyle(fontStyle: FontStyle.italic, color: kGold)),
        backgroundColor: kDarkBrown,
        foregroundColor: kGold,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List>(
                future: viewCategoryItemsData(),
                builder: (ctx,ss) {
                  if(ss.hasData)
                  {
                    return Items(list_:ss.data!!,size_: size);
                  }
                  else{
                    return Center
                      (
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  List list_;
  var size_;

  Items({required this.list_, required this.size_});

  @override
  State<StatefulWidget> createState()
  {


    return ItemsState(list: list_,size: size_);
   //return ItemsState(list_:list_,size_: size_);
    //return Items(list_: list_,size_: );
  }
}

class ItemsState extends State<Items>{

  late List list;
  var size;

  ItemsState({required this.list,required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
       // padding: EdgeInsets.all(10),
        children: List.generate(list.length, (index) {
          return Card(
              elevation: 3,
              shadowColor: kBrown,
              color: kTerracotta,
          child: Column(
            children: [
              Image.network(list[index]['c_images'],
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return SizedBox(
                    height: size.height*17/100,
                    child: Center(
                      child: Icon(Icons.error,size: 40, color: kBrown,),
                    ),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: size.height*17/100,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!!
                            : null,
                      ),
                    ),
                  );
                },
                height: size.height*17.4/100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: size.height*6/120,
                decoration: BoxDecoration(
                  color: kGold,
                ),

                child: Row
                  (
                    children:
                    [
                      SizedBox(height: size.height*2.5/100),
                      SizedBox(width: size.width*10/100),

                      InkWell(
                        onTap: ()
                        {
                          _share(list[index]['c_images']);
                        },

                        child: Icon(Icons.share,color: kBrown),
                      ),

                      SizedBox(width: size.width*17/95),

                      InkWell(
                        onTap: ()
                        {
                          _save(list[index]['c_images']);
                        },
                        child: Icon(Icons.download,color: kBrown),
                      ),
                    ]
                  ),

              ),
            ],
          )
          );
        }),
      ),
    );
  }

  Future<void> _share(var url)async
  {
    String fileName = url.substring(url.lastIndexOf("/") + 1);
    final uri = Uri.parse(url);
    final res = await http.get(uri);
    final bytes = res.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/$fileName';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path]);


  }

  Future<void> _save(list) async
  {
    _onLoad(true);
    var status = await Permission.manageExternalStorage.request();


    if(status.isGranted)
    {
      //_onLoadExit(true);
    }

  }
  void _onLoad(bool showBox) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            children: [
              Row(
                children: [
                  SizedBox(width: 15),
                  CircularProgressIndicator(),
                  SizedBox(width: 17),
                  Text("Downloading...",
                      style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1,
                          color: Colors.blueGrey)),
                ],
              ),
            ],
          );
        });
  }

  void _onLoadExit(bool exitBox) {
    if (exitBox) {
      Future.delayed(const Duration(milliseconds: 1), () {
        Navigator.pop(context);
      });
    }
  }
}
