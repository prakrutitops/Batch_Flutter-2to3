import 'dart:io';

void main()
{
  int lastdigit=0;

  print("Enter Any Number");
  int num = int.parse(stdin.readLineSync().toString());

  while (num>0)
  {
    lastdigit = lastdigit+num%10;

    num=num~/10;
  }
  print("Sum Of all digit is $lastdigit");
}