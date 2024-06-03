class Emp
{
    //data memebrs,variables

    //global variable
    int id=0;
    String name="";

    //para constructor
    Emp(int id,String name)
    {
      this.id=id;
      this.name=name;

    }
    show()
    {
      print("Your id is $id");

      print("Your name is $name");
    }



}
void main()
{
  var e1 = Emp(101,"Jay");
  var e2 = Emp(102,"Ajay");

  e1.show();
  e2.show();
}