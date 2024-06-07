import 'dart:io';

void main()
{
    int alphabet = 64;

  for(int i=1;i<=5;i++)//row
  {
    for(int j=1;j<=i;j++)//col
     {
        //stdout.write("${String.fromCharCode(alphabet+j)}");
      stdout.write("A");
     }
      print("");

  }
}