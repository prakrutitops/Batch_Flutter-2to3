import 'dart:io';

validate(var age)
{
    if(age>18)
    {
      print("Eligible to vote");
    }
    else
    {
        throw StdoutException("xyz");
    }
}
void main()
{

  validate(15);

}