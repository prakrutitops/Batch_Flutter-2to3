import 'dart:io';

void main()
{


  print("Enter Your Age");
  int age = int.parse(stdin.readLineSync().toString());

  if(age>=18)
  {
    print("Eligible to vote");

    //nested if
    if(age>=60)
    {
        print("Senior citizen");
    }
    else
    {
      print("Young age");
    }

  }
  else
  {
    print("Not Eligible to vote");
  }
}