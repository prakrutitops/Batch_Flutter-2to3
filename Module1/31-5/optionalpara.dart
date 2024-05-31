class Emp
{
  //-[] - optional parameter
  getdetail(String name,[var email,var bikeno])
  {
    print("Your Name is $name");
    print("Your Email is $email");
    print("Your Bike Number is $bikeno");
  }

}

void main()
{
  var e1 = Emp();
  var e2 = Emp();
  e1.getdetail("Jay", "J@gmail.com", "GJ03DA0102");
  e2.getdetail("Nirmal");
}