class Emp
{
  //-{} - default parameter
  getdetail(var name,[String city="Rajkot"])
  {
    print("Your Name is $name");
    print("Your City is $city");



  }

}

void main()
{
  var e1 = Emp();
  e1.getdetail("a1");
  e1.getdetail("a1");
  e1.getdetail("a1");
  e1.getdetail("a1");
  e1.getdetail("a1");
}