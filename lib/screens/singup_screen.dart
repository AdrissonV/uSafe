import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/logo.png'),
                        height: 200.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: TextFormField(
                          controller: email,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Insira seu e-mail!";
                            } else if (!value.contains('@')) {
                              return "Insira um e-mail válido";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: TextFormField(
                          controller: senha,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe sua senha!";
                            } else if (value.length < 6) {
                              return "Sua senha deve ter no mínimo 6 caracteres";
                            }
                          },
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
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
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ]
                                : [
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        "Entrar",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
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
                    ],
                  ),
                ))));
  }
}
