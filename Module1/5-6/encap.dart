import 'package:flutter2to3/5-6/gettersetter.dart';

class Mydata
{

  void data()
  {
    var s = Student();

    //value set
   s.id=101;//method call//set
   s.name="jay";

    //value get
    print(s.id);//get
    print(s.name);

  }

}
void main()
{
  var s = Mydata();
  s.data();
}