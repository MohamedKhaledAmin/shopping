import 'package:storeapp/screens/home.dart';
import 'package:storeapp/screens/login.dart';
import 'package:storeapp/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(
    ChangeNotifierProvider(builder: (_) => UserProvider.initialize(),
        child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
    _register();
  }

  void getMessage(){
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          setState(() => _message = message["notification"]["title"]);
        }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Colors.deepOrange
        ),
      home: ScreensController(),
    );
  }
}


//void main() {
//  runApp(ChangeNotifierProvider(builder: (_) => UserProvider.initialize(),
//  child: MaterialApp(
//    debugShowCheckedModeBanner: false,
//    theme: ThemeData(
//        primaryColor: Colors.deepOrange
//    ),
//    home: ScreensController(),
//  ),));
//}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}




