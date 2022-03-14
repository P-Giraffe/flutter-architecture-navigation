import 'package:flutter/material.dart';
import 'package:flutter_avance/ui/screens/login_screen.dart';
import 'package:flutter_avance/ui/screens/login_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purple Giraffe - Flutter Avancé',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(LoginViewModel()),
    );
  }
}
