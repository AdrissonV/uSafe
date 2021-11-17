import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:u_safe/services/auth_services.dart';

class MissionScreen extends StatefulWidget {
  MissionScreen({Key? key}) : super(key: key);

  _MissionScreenState createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  logout() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().logout();
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missões'),
      ),
      body: Center(
          child: Text(
        'Você não possuí missões criadas',
        style: TextStyle(color: Colors.grey),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            logout();
          }),
    );
  }
}
