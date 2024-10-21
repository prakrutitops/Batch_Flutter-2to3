import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async
{
  print("Handling a background message: ${message.messageId}");
}

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _getToken();
    _setupForegroundMessaging();
  }

  // Future<void> _requestPermission() async {
  //   await FirebaseMessaging.instance.requestPermission();
  // }
  Future<void> _requestPermission() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  // Future<void> _getToken() async {
  //   token = await FirebaseMessaging.instance.getToken();
  //   print("FCM Token: $token");
  // }


  Future<void> _getToken() async {
    try {
      token = await FirebaseMessaging.instance.getToken();
      print("FCM Token: $token");
    } catch (e) {
      print("Error retrieving FCM token: $e");
    }
  }

  void _setupForegroundMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received a message in the foreground: ${message.notification?.title}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FCM Demo')),
      body: Center(
        child: Text('FCM Token: $token'),
      ),
    );
  }
}
