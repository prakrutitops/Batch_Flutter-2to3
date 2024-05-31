//With Para With Return
int add(int a ,int b)
{
  return a+b;
}

//Without Para Without Return
 add2()
{
  var a = 6;
  var b = 5;
  var c=a+b;
  print(c);
}
//With Para without Reuturn type
add3(int a,int b)
{
    var c = a+b;
    print(c);
}
//Without para with Return type
int add4()
{
  var a= 6;
  var b= 5;

  return a+b;

}



void main()
{
  print(add(6, 5));
  add2();
  add3(6, 5);
  print(add4());
}