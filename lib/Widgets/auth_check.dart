import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_safe/screens/login_screen.dart';
import 'package:u_safe/screens/mission.dart';
import 'package:u_safe/screens/singup_screen.dart';
import 'package:u_safe/services/auth_services.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

_navigationMissionScreen() async* {
  await MaterialPageRoute(builder: (context) => MissionScreen());
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    print(auth.usuario);
    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginScreen();
    else
      return MissionScreen();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
