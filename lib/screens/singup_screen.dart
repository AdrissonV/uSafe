import 'package:flutter/material.dart';
import 'package:u_safe/screens/singup2_screen.dart';

class SingUpScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Image(
                image: AssetImage('assets/logo-preto.png'),
                height: 200.0,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Nome Completo",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              validator: (text) {
                if (text!.isEmpty) return "Nome inválido";
              },
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(
                hintText: "Senha",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              obscureText: true,
              validator: (text) {
                if (text!.isEmpty || text.length < 6) return "Senha inválida";
              },
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: _confirmController,
              decoration: InputDecoration(
                hintText: "Repetir senha",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              obscureText: true,
              validator: (text) {
                if (text!.isEmpty || text.length < 6)
                  return "Senha inválida";
                else if (_passController.text != text)
                  return "Senhas diferentes";
              },
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SingUp2Screen(
                            /* name: _nameController.text,
                            pass: _passController.text*/
                            )));
                  }
                },
                child: Text(
                  'Continuar',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(2.0),
                        side: new BorderSide(color: Colors.black)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
