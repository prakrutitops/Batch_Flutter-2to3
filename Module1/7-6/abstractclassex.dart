abstract class A
{
  a();
}
abstract class B
{
  b();
}
class C implements A
{
  @override//annotation
  a() {
    // TODO: implement a
    throw UnimplementedError();
  }


}
void main()
{
  var a = C();

}