class A
{
  void a()
  {
    print("a");
  }
}
class B extends A
{
  void b()
  {
    print("b");
  }
}
abstract class C
{
  void c();

}
class D extends B implements C
{
  void d()
  {
    print("d");
  }

  @override
  void c()
  {
    print("c");
  }
}
void main()
{
  var d = D();
  d.a();
  d.b();
  d.c();
  d.d();
}