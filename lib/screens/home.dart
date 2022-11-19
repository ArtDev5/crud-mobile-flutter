import 'package:desafio/bottom_navigation_bar_component.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

import 'cadastrarFilme.dart';
import 'editar.dart';
import 'excluir.dart';
import 'exibir.dart';
import 'filmeList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _nextScreenCadastrar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CadastrarFilme()));
  }

  void _nextScreenExibirFilme() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TableList(MovieAction.SHOW)));
  }

  void _nextScreenEditarFilme() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TableList(MovieAction.UPDATE)));
  }

  void _nextScreenExcluirFilme() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TableList(MovieAction.REMOVE)));
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                ElevatedButton(
                  onPressed: () => _nextScreenCadastrar(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900], shape: StadiumBorder()),
                  child: const Text("CADASTRAR FILME",
                      style: TextStyle(fontSize: 23, fontFamily: "Raleway")),
                ),
                ElevatedButton(
                  onPressed: () => _nextScreenExibirFilme(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900], shape: StadiumBorder()),
                  child: const Text("EXIBIR FILME",
                      style: TextStyle(fontSize: 23, fontFamily: "Raleway")),
                ),
                ElevatedButton(
                  onPressed: () => _nextScreenEditarFilme(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900], shape: StadiumBorder()),
                  child: const Text("EDITAR FILME",
                      style: TextStyle(fontSize: 23, fontFamily: "Raleway")),
                ),
                ElevatedButton(
                  onPressed: () => _nextScreenExcluirFilme(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900], shape: StadiumBorder()),
                  child: const Text("EXCLUIR FILME",
                      style: TextStyle(fontSize: 23, fontFamily: "Raleway")),
                )
              ]))),
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
