//exception - errors
/*

  1)Compile time
  2)Runtime

  Exception Keywords
  try-catch
  finally
  throw
  throws

  Error Possible

block:

try
{

}
catch()
{
}

 */

void main()
{
    var num = 5;
    int div;

    try
    {
      //logic
      div = num ~/ 0;
      print(div);

    }
    catch(e)
    {
      print(e);
    }
    finally
    {
      int add = num+2;
      int sub = num-2;
      int mul = num*2;


      print(add);
      print(sub);
      print(mul);

    }



}