class Model
{
  late final String imageUrl;
  late final String title;
  late final String subtitle1;
  late final String subtitle2;

  Model
  ({
      required this.imageUrl,
      required this.title,
      required this.subtitle1,
      required this.subtitle2
  });

  // String get subtitle2 => _subtitle2;
  //
  // set subtitle2(String value) {
  //   _subtitle2 = value;
  // }
  //
  // String get subtitle1 => _subtitle1;
  //
  // set subtitle1(String value) {
  //   _subtitle1 = value;
  // }
  //
  // String get title => _title;
  //
  // set title(String value) {
  //   _title = value;
  // }
  //
  // String get imageUrl => _imageUrl;
  //
  // set imageUrl(String value) {
  //   _imageUrl = value;
  // }
}