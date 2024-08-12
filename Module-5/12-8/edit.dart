import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex123/dashboard.dart';


class Edit extends StatefulWidget
{
  late List list;
  late int index;

  Edit({required this.list,required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit>
{



  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  @override
  void initState()
  {
    // TODO: implement initState
   // super.initState();

    pname = TextEditingController(text: widget.list[widget.index]['pname']);
    pprice = TextEditingController(text: widget.list[widget.index]['pprice']);
    pdes = TextEditingController(text: widget.list[widget.index]['pdes']);
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Index is ${widget.index}"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            TextFormField(controller: pname,decoration: InputDecoration(hintText: "Enter Your Firstname"),),
            SizedBox(height: 10,),
            TextFormField(controller: pprice,decoration: InputDecoration(hintText: "Enter Your Lastname"),),
            SizedBox(height: 10,),
            TextFormField(controller: pdes,decoration: InputDecoration(hintText: "Enter Your Email"),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              _updatedata();
              Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()));



            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }

  void _updatedata()
  {
    var url = Uri.parse("https://topstech8.000webhostapp.com/MYAPI/update.php");
    http.post(url,body:
    {
      "id":widget.list[widget.index]['id'],
      "pname":pname.text.toString(),
      "pprice":pprice.text.toString(),
      "pdes":pdes.text.toString()

    });
  }
}
