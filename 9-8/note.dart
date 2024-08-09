class Note
{

  late String _title;
  late String _description;



  String get title => _title;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();

    map['title'] = _title;
    map['description'] = _description;


    return map;
  }
}