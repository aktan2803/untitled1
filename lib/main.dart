import 'package:flutter/material.dart';
import 'package:untitled1/pages/LogIn.dart';
import 'package:untitled1/pages/home.dart';



void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Sen',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LogIn(),
        '/home': (context) => const GameScreen(title: "Game XO"),
      },
    );
  }
}
