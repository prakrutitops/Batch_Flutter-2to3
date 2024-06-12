void main()
{
  var fixedLengthList = List<dynamic>.filled(7,0);

  print("Before: $fixedLengthList");

  fixedLengthList[0]="aaa";
  fixedLengthList[2]="bbb";
  fixedLengthList[1]="ccc";
  fixedLengthList[3]="ddd";
  fixedLengthList[4]="eee";
  fixedLengthList[5]="aaa";
  fixedLengthList[6]="bbb";
  fixedLengthList[5]="ooo";
  //fixedLengthList[5]=666;

  print("After : $fixedLengthList");

}