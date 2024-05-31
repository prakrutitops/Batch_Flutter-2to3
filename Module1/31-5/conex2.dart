class Student
{
    //default constructor
    static int count = 0;
    Student()
    {
        count++;
        print(count);
    }



}
void main()
{
  var s1 = Student();//automaticlly constructor call
  var s2 = Student();
  var s3 = Student();

}