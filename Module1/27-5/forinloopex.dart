void main()
{

    //Collection of Items
    List data = ["Android","Java","PHP"];


    //
    // 1)generic type
    // List<int>tech = [1,2,4,5];
    //
    // 2)var data = ["Android","Java","PHP",1,3];
    //
    // 3) List tech = [1,2,4,5];

    // for(int i=0;i<tech.length;i++)
    // {
    //     print(tech[i]);
    // }

    //for in loop
    for(String data in data)
    {
      print(data);
    }


}