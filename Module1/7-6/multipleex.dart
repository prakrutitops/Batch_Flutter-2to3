abstract class A
{
  a();
}
abstract class B
{
  b();
}

class C implements A,B
{
  @override
  a()
  {
    // TODO: implement a
    print("a");
  }

  @override
  b() {
    // TODO: implement b
    print("b");
  }

}
void main()
{
  var c = C();
  c.a();
  c.b();
}