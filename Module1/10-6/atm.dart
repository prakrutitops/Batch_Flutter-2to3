import 'dart:io';

import 'package:flutter2to3/10-6/customexception.dart';

class ATM
{

    static var initialamount=0;

    ATM(var num)
    {


        switch(num)
        {
          case 1:
              deposite();


          case 2:
                withdraw();



        }
    }

  void deposite()
  {


      print("Enter Your Amount For Deposite");
      int amount = int.parse(stdin.readLineSync().toString());
      initialamount+=amount;
      print("Your Total Amount is $initialamount");


  }

  void withdraw()
  {

    print("Enter Your Amount For Withdraw");
    int wamount = int.parse(stdin.readLineSync().toString());
    try
    {
      if(wamount>initialamount)
      {
        throw InsufficientFundException("Your Account does not have sufficient balance");
      }
      else
      {
        initialamount-= wamount;
        print("Your Remaining balance is $initialamount");
      }
    }
    catch(e)
    {
      print("Your Account does not have sufficient balance");
    }



  }
}
void main()
{

    while(true)
    {
      print("\n Press 1 For Deposite Amount \n Press 2 For Withdraw Amount");
      var num = int.parse(stdin.readLineSync().toString());

      var a1 = ATM(num);
    }



}