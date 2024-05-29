import 'dart:io';

void main()
{
    int temp,max=0;

    print("Enter Any Number");
    int num = int.parse(stdin.readLineSync().toString());

    while(num>0)
    {
      temp = num%10;

      if(temp>max)
      {
          max = temp;
      }

      num = num ~/ 10;

    }
    print("Max Number is $max");





}