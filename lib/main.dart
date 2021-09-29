import 'package:flutter/material.dart';
import 'package:u_safe_seguranca/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Color.fromARGB(255, 63, 81, 181)
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
