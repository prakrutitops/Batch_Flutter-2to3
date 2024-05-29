class Student
{
  //data members,variables
  //basic initialization - late
    var rollnum;
    var name;

    //method
   display()
   {
      print("Your Rollnumber is $rollnum");
      print("Your Rollnumber is $name");
   }


}

void main()
{
    //how to create an object

    var s1 = Student();
    var s2 = Student();
    var s3 = Student();

    s1.rollnum=101;
    s1.name="Jay";

    s2.rollnum=102;
    s2.name="Nirmal";

    s3.rollnum=103;
    s3.name="Mayank";

    s1.display();
    s2.display();
    s3.display();

    //you have to call with brackets outside class
    //print("Your Name is ${s1.name}");

}