import 'package:flutter/material.dart';
import 'my_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black45),
      home: const MyHomePage(),
    );
  }
}
