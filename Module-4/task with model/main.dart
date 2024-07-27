// main.dart
import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final DBHelper _dbHelper = DBHelper();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    List<User> users = await _dbHelper.getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('Age: ${user.age}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _dbHelper.insertUser(User(id: 0, name: 'John Doe', age: 30));
          _loadUsers();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
