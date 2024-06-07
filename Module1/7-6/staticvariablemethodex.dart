class Student
{
  var id;
  var name;
  static var college="Atmiya";

  Student(var id, var name)
  {
      this.id=id;
      this.name=name;
  }

  void display()
  {
    print("Your id is $id");
    print("Your name is $name");
    print("Your college is $college");

  }
  static void change()
  {
    college="VVP";
  }

}

void main()
{
  var s1 = Student(101,"Jay");
  var s2 = Student(102,"Nirmal");

  Student.change();

  s1.display();
  s2.display();

}