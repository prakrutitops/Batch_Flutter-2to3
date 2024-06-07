class Rbi
{
  int rate()
  {
    return 0;
  }
}
class Sbi extends Rbi
{
  int rate()
  {
    return 7;
  }
}
class Icici extends Rbi
{
  int rate()
  {
    return 8;
  }
}
class Axis extends Rbi
{
  int rate()
  {
    return 9;
  }
}
void main()
{
  var r = Rbi();

  r = Sbi();
  print(r.rate());
  r=Icici();
  print(r.rate());
  r=Axis();
  print(r.rate());
}
