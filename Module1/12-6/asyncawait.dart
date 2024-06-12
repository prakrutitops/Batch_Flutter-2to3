//time delay
Future delaytime(int seconds,String msg)
{
  var duration=Duration(seconds: seconds);

  return Future.delayed(duration).then((value) => print(msg));
}

void main()async
{
    print("Life");
    await delaytime(5,"Is");
    print("Good");
}