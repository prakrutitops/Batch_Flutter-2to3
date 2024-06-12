void main()
{
  var fixedLengthList = List<int>.filled(5,0);

  print("Before: $fixedLengthList");

  fixedLengthList[0]=111;
  fixedLengthList[2]=333;
  fixedLengthList[1]=222;
  fixedLengthList[3]=444;
  fixedLengthList[4]=555;
  fixedLengthList[5]=666;

  print("After : $fixedLengthList");

}