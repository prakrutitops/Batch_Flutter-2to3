import 'package:flutter/material.dart';

class Model extends StatelessWidget {

  List? list;
  int? albumId;
  String? title;
  String? url;
  String? thumbnailUrl;

  Model({this.list});
  Model.a({this.albumId,this.title, this.url, this.thumbnailUrl});

  Model.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];

    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;

    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }


  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
          itemCount: list!.length,
          itemBuilder:(context,index)
          {
              return ListTile
                (
                    title: Text(list![index]["title"]),
                    subtitle: Column
                      (
                          children:
                          [
                            Text(list![index]["albumId"].toString()),
                            Image.network(list![index]["url"]),
                            Image.network(list![index]["thumbnailUrl"])

                          ],
                      ),
                );
          }
      );
  }
}

