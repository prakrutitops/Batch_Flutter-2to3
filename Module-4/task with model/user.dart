// user.dart
class User {
  final int id;
  final String name;
  final int age;

  User({required this.id, required this.name, required this.age});

  // Convert a User into a Map. The keys must correspond to the column names in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Convert a Map into a User. The keys must correspond to the column names in the database.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }
}
