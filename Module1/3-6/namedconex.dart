class Tops2
{
  var id;
  var name;
  var email;

  Tops2(var id,var name,[var email])
  {
      this.id=id;
      this.name=name;
      this.email=email;
  }
  //named constructor
  Tops2.a(var id,var name)
  {
    this.id=id;
    this.name=name;
    print("Your id is $id , Your Name is $name");
  }

  void display()
  {
      print("Your id is $id , Your Name is $name, Your Email is $email");
  }
}

void main()
{

  var t1 = Tops2(101, "Jay", "J@gmail.com");
 // var t2 = Tops2(102, "xyz");
  //var t2 = Tops2.a(id, name)
  t1.display();
  Tops2.a(102, "xyz");//named cons call
  Tops2.a(103, "abc");

}