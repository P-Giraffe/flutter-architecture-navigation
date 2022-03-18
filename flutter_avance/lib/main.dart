import 'package:flutter/material.dart';
import 'package:flutter_avance/data/use_cases/login_use_cases.dart';
import 'package:flutter_avance/ui/navigation/navigation_delegate.dart';
import 'package:flutter_avance/ui/navigation/navigation_route_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationDelegate = NavigationDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Purple Giraffe - Flutter Avancé',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: NavigationRouteParser(),
      routerDelegate: navigationDelegate,
    );
  }
}
