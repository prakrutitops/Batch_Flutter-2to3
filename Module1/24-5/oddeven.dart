import 'dart:io';

void main()
{

   // int num = 0;
    print("Enter Your Number");//printf
    int num = int.parse(stdin.readLineSync().toString());//scanf


    //print(num%2==0);
    if(num%2==0)
    {
      print("Even");
    }
    else
    {
      print("Odd");
    }


}