void main()
{
  final map = Map<int,String>();
  
  map.putIfAbsent(101, () => "1234");
  map.putIfAbsent(102, () => "5678");
  map.putIfAbsent(103, () => "1234");
  map.putIfAbsent(104, () => "5678");

  print(map);
  
}