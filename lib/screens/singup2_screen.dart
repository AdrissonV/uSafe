import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:u_safe/screens/mission.dart';

class SingUp2Screen extends StatefulWidget {
  const SingUp2Screen({Key? key}) : super(key: key);

  @override
  _SingUp2ScreenState createState() => _SingUp2ScreenState();
}

class _SingUp2ScreenState extends State<SingUp2Screen> {
  final _emailController = TextEditingController();
  final _dddController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _numController = TextEditingController();
  final _bairroController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

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
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text!.isEmpty || !text.contains('@'))
                    return "E-mail inválido";
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dddController,
                      decoration: InputDecoration(
                        hintText: "DDD",
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      validator: (text) {
                        if (text!.isEmpty) return "DDD inválido";
                      },
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: "Nun. Celular",
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      validator: (text) {
                        if (text!.isEmpty || text.length < 6)
                          return "Num. Celular inválido";
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: "Endereço",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.streetAddress,
                validator: (text) {
                  if (text!.isEmpty) return "Endereço inválido";
                },
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _numController,
                      decoration: InputDecoration(
                        hintText: "Número",
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      validator: (text) {
                        if (text!.isEmpty) return "Número inválido";
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _bairroController,
                      decoration: InputDecoration(
                        hintText: "Bairro",
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      validator: (text) {
                        if (text!.isEmpty) return "Bairro inválido";
                      },
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> userData = {
                        /*"name": name,*/
                        "email": _emailController.text,
                        "ddd": _dddController.text,
                        "phone": _phoneController.text,
                        "address": _addressController.text,
                        "num": _numController.text
                      };
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MissionScreen()));
                    }
                  },
                  child: Text(
                    'Criar conta',
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
        ));
  }
}
