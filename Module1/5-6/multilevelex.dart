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
class C extends B
{
  void c()
  {
    print("c");
  }
}
void main()
{
  var c = C();
  c.a();
  c.b();
  c.c();
}