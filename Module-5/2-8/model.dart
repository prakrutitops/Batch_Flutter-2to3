import 'package:flutter/material.dart';

class Model extends StatelessWidget
{

  late List list;
  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index)
        {

          return ListTile
            (
                leading: Image.network(list[index]['t_logo'],width: 250,height: 250),
                title:Text(list[index]['t_name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.00),),
                subtitle:Text(list[index]['t_captain'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.00))
            );

        },

      );
  }

}

//task - https://simplifiedcoding.net/demos/marvel/