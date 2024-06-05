class MyColor
{
  var color ="black";
}
class MyColor2 extends MyColor
{
  var color ="white";

  void show()
  {
    print(color);
    print(super.color);//super - parent class value call
  }

}
void main()
{
  var m = MyColor2();
  m.show();


}