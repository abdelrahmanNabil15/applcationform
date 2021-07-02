
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_a/screens/IntroScreen.dart';
import 'package:project_a/screens/add_screen.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FocusNode _NameFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: IntroScreen(),
    );
  }
}