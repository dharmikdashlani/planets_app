import 'package:flutter/material.dart';
import 'package:galaxy_planets/view/screens/home.dart';
import 'package:galaxy_planets/view/screens/splesh.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      routes: {
        '/': (context) => const Screen(),
        'Home': (context) => const Home(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
