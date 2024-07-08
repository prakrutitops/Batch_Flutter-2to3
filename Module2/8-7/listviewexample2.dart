import 'package:flutter/material.dart';

import 'model.dart';

class MyList2 extends StatelessWidget {


  final List<Model> items =
  [
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    Model(
      imageUrl: 'https://img.freepik.com/free-photo/close-up-portrait-young-successful-african-american-adult-man-red-hoodie_176420-33869.jpg',
      title: 'Nikhil',
      subtitle1: 'nikhil@gmail.com',
      subtitle2: '999999',

    ),
    Model(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
      title: 'Parthiv',
      subtitle1: 'parthiv@gmail.com',
      subtitle2: '123456789',

    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview Example"),
      ),
      body: ListView.builder
        (
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(

              children: [

                ListTile
                  (
                    leading: Image.network(items[index].imageUrl,height: 300,width: 100,),
                    title: Column
                      (children:
                    [
                      Text(items[index].title,style: TextStyle(fontWeight: FontWeight.bold,backgroundColor: Colors.blueGrey),),
                      Text(items[index].subtitle1),
                      Text(items[index].subtitle2)
                    ],),


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
