import 'package:flutter/material.dart';
import 'package:u_safe/widgets/auth_check.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uSafe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ).copyWith(
          secondary: Colors.orangeAccent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}
