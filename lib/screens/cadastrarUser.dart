import 'package:desafio/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

import '../bottom_navigation_bar_component.dart';

class CadastrarUser extends StatefulWidget {
  @override
  CadastrarUserState createState() => CadastrarUserState();
}

class CadastrarUserState extends State<CadastrarUser> {
  final myControllerUser = TextEditingController();
  final myControllerEmail = TextEditingController();
  final myControllerFirstPassword = TextEditingController();
  final myControllerSecondPassword = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Senhas não coincidem"),
          actions: <Widget>[
            // define os botões na base do dialogo
            ElevatedButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _cadastrarUser() {
    if (myControllerFirstPassword.text != myControllerSecondPassword.text) {
      _showDialog();
    } else {
      MyApp.users.add(User(
          user: myControllerUser.text,
          email: myControllerEmail.text,
          password: myControllerFirstPassword.text));
      Navigator.pushReplacementNamed(context, "/home", arguments: {});
    }
  }

  OutlineInputBorder _inputBorderDecoration() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 25),
              Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Hardflix',
                    style: TextStyle(
                      fontSize: 45,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.blue[700]!,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Hardflix',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              Image.asset('lib/icon.jpg', height: 200.0, width: 200.0),
              const SizedBox(height: 30),
              Text("CADASTRAR USUÁRIO",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                  controller: myControllerUser,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: _inputBorderDecoration(),
                      focusedBorder: _inputBorderDecoration(),
                      filled: true,
                      fillColor: Colors.black,
                      hintText: "Usuário",
                      hintStyle: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic))),
              const SizedBox(height: 5),
              TextField(
                  controller: myControllerEmail,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: _inputBorderDecoration(),
                      focusedBorder: _inputBorderDecoration(),
                      filled: true,
                      fillColor: Colors.black,
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic))),
              const SizedBox(height: 5),
              TextField(
                  controller: myControllerFirstPassword,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: _inputBorderDecoration(),
                      focusedBorder: _inputBorderDecoration(),
                      filled: true,
                      fillColor: Colors.black,
                      hintText: "Senha",
                      hintStyle: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic))),
              const SizedBox(height: 5),
              TextField(
                  controller: myControllerSecondPassword,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: _inputBorderDecoration(),
                      focusedBorder: _inputBorderDecoration(),
                      filled: true,
                      fillColor: Colors.black,
                      hintText: "Confirmar senha",
                      hintStyle: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic))),
              const SizedBox(height: 10),
              SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => _cadastrarUser(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        shape: StadiumBorder()),
                    child: const Text("Cadastrar",
                        style: TextStyle(fontSize: 23, fontFamily: "Raleway")),
                  )),
            ],
          ),
        ),
      )),
      bottomNavigationBar: FloatingActionButton.small(
          tooltip: "Sair",
          backgroundColor: Colors.black,
          child: Icon(Icons.logout),
          onPressed: () => Navigator.popAndPushNamed(
                context,
                "/",
              )),
    );
  }
}
