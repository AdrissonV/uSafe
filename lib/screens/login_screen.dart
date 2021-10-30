import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:u_safe/screens/mission.dart';
import 'package:u_safe/screens/singup_screen.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Builder(builder: (context) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(30.0),
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Image(
                    image: AssetImage('assets/logo.png'),
                    height: 200.0,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text!.isEmpty || !text.contains('@'))
                      return "E-mail inválido";
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isEmpty || text.length < 6)
                      return "Senha inválida";
                  },
                  style: TextStyle(color: Colors.white),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MissionScreen()));
                      }
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 22, 46, 131),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            side: new BorderSide(color: Colors.white)))),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SingUpScreen()));
                    },
                    child: Text(
                      "Não possui uma conta? Cadastre-se aqui",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextButton(
                    onPressed: null,
                    child: Image.asset(
                      'assets/google-btn.png',
                      height: 40.0,
                    ))
              ],
            ),
          );
        }));
  }
}
