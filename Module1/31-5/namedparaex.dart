class Emp
{
  //-{} - named parameter
  getdetail(var name,{var surname,var email,var mob,var city})
  {
    print("Your Name is $name");
    print("Your Surname is $surname");
    print("Your Email is $email");
    print("Your Mobile is $mob");
    print("Your City is $city");


  }

}

void main()
{
    var e1 = Emp();
    e1.getdetail("Jay",email:"J@gmail.com",surname:"Rathod",city:"Rajkot",mob:"123456");
}