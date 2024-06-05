final class MyData
{
  final int speed = 90;
  //final will fix the value that will never change
  //You can not inherit final class

  void a()
  {
    speed = 120;
    print(speed);
  }
}
class M2 extends MyData
{

}
void main()
{
  var m1 = MyData();
  m1.a();
}
