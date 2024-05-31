import 'dart:io';

class Student2
{
  //data members,variables
  //basic initialization - late
    var rollnum;
    var name;

    //method
   display()
   {
      print("Your Rollnumber is $rollnum");
      print("Your Name is $name");
   }


}

void main()
{
    //how to create an object

    var s1 = Student2();
    var s2 = Student2();
    var s3 = Student2();

    print("Enter Your Id ");
    int id = int.parse(stdin.readLineSync().toString());

    print("Enter Your Name ");
    var name = stdin.readLineSync().toString();

    s1.rollnum=id;
    s1.name=name;


    s1.display();
    //s2.display();
   // s3.display();

    //you have to call with brackets outside class
    //print("Your Name is ${s1.name}");

}