import 'dart:io';

void main()
{

  print("\n Press 1 For English \n Press 2 For Hindi \n Press 3 For Gujarati");
  int num = int.parse(stdin.readLineSync().toString());

  switch(num)
  {
    case 1: print("Your Language is English");
    //break;
    case 2: print("Your Language is Hindi");
    //break;
    case 3: print("Your Language is Gujarati");
    //break;

    default:print("Your Number is not valid");
    break;

  }


}