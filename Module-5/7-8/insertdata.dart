import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonex123/dashboard.dart';
class InsertData extends StatefulWidget
{
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData>
{

  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  late String pname1,pprice1,pdes1;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Json Crud"),),
      body: Padding
        (
        padding: EdgeInsets.all(16.0),
        child: Column
          (
          children:
          [

            TextFormField(controller:pname,decoration: InputDecoration(hintText: "Enter Product Name", enabledBorder: OutlineInputBorder
              (
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10))),),
            SizedBox(height: 10,),
            TextFormField(controller:pprice,decoration: InputDecoration(hintText: "Enter Product Price", enabledBorder: OutlineInputBorder
              (
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),))),
            SizedBox(height: 10,),
            TextFormField(controller:pdes,decoration: InputDecoration(hintText: "Enter Product Description", enabledBorder: OutlineInputBorder
              (
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),))),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: ()
            {
                pname1 = pname.text.toString();
                pprice1 = pprice.text.toString();
                pdes1 = pdes.text.toString();
                insertdata();

            }, child: Text("Insert")),



          ],
        ),
      ),
    );
  }

  void insertdata()
  {
    var url = Uri.parse("https://topstech8.000webhostapp.com/MYAPI/insert.php");
    http.post(url, body:
    {
      "pname":pname1,
      "pprice":pprice1,
      "pdes":pdes1,


    });
    Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()));
  }
}