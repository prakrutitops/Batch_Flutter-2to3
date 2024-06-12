void main()
{
  final set = Set();

  set.add("aayush");
  set.add("sagar");
  set.add("aayush");
  set.add("sagar");

  final set2 = Set();
  set2.add("nimral");
  set2.add("jay");


  set.addAll(set2);
  //growableList.remove("sagar");
  set.remove("sagar");
  print(set.length);
  print(set.isEmpty);
  //first,last
  print(set);
  // print(growableList2);
}