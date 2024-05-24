import 'dart:io';

void main()
{

    print("Enter Your name");
    var name = stdin.readLineSync();

    print("Enter Your Email id");
    var email = stdin.readLineSync();

    print("Enter Your Mobile Number");
    int number = int.parse(stdin.readLineSync().toString());

    print("Enter Your Salary");
    double salary = double.parse(stdin.readLineSync().toString());

    print("Enter Your Address");
    String address = stdin.readLineSync().toString();


    print("Your name is $name");
    print("Your email is $email");
    print("Your number is $number");
    print("Your salary is $salary");
    print("Your address is $address");
    // print("Your name is "+name.tostring());


}