import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class Model extends StatelessWidget
{
  late List list;
  Model({required this.list});

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
        itemCount:list.length,
        itemBuilder: (context,index)
        {
          return ListTile
            (
              title: Text(list[index]["pname"],style: TextStyle(fontSize: 20.00,color: Colors.blue),),
              subtitle: Column
                (
                  children:
                  [
                    Text(list[index]["pprice"],style: TextStyle(fontSize: 15.00,color: Colors.orange)),
                    Text(list[index]["pdes"],style: TextStyle(fontSize: 15.00,color: Colors.orange))

                  ],
                ),
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Details(list:list,index:index)));
            },
            );
        });
  }

}