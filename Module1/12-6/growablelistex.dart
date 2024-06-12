void main()
{
  final growableList = List.empty(growable: true);
  growableList.add("jay");
  growableList.add("nimral");

  final growableList2 = List.empty(growable: true);
  growableList2.add("aayush");
  growableList2.add("sagar");
  growableList2.add("aayush");
  growableList2.add("sagar");

  growableList.addAll(growableList2);
  //growableList.remove("sagar");
  growableList.removeAt(2);
  print(growableList.length);
  print(growableList.isEmpty);
  //first,last
  print(growableList);
  // print(growableList2);

  // Iterator i = growableList.iterator;
  // while(i.moveNext())
  // {
  //   print(i.moveNext());
  // }
}