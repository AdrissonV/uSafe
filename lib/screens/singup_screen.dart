import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';
import 'package:u_safe/screens/login_screen.dart';
import 'package:u_safe/services/auth_services.dart';

class SingUpScreen extends StatefulWidget {
  SingUpScreen({Key? key}) : super(key: key);

  _SingUpScreen createState() => _SingUpScreen();
}

class _SingUpScreen extends State<SingUpScreen> {
  final email = TextEditingController();
  final senha = TextEditingController();
  final confSenha = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  bool confirmed = false;

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  confirmarSenha(senha, confSenha) {
    if (senha == confSenha) {
      confirmed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                          height: 200.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              labelText: "E-mail",
                              hintStyle: TextStyle(color: Colors.black),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(),
                              )),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Insira seu e-mail!";
                            } else if (!value.contains('@')) {
                              return "Insira um e-mail válido";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: TextFormField(
                          controller: senha,
                          decoration: InputDecoration(
                              labelText: "Senha",
                              hintStyle: TextStyle(color: Colors.black),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(),
                              )),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe sua senha!";
                            } else if (value.length < 6) {
                              return "Sua senha deve ter no mínimo 6 caracteres";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        child: TextFormField(
                          controller: confSenha,
                          decoration: InputDecoration(
                              labelText: "Confirmar senha",
                              hintStyle: TextStyle(color: Colors.black),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(),
                              )),
                          obscureText: true,
                          validator: (value) {
                            confirmarSenha(value, senha.text);
                            if (value!.isEmpty) {
                              print(senha.text);
                              return "Confirme sua senha!";
                            } else if (confirmed == false) {
                              return "As senhas devem ser iguais.";
                            }
                          },
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              registrar();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: (loading)
                                ? [
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  ]
                                : [
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        "Criar conta",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
