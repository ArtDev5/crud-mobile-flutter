import 'package:desafio/entities/filme.dart';
import 'package:desafio/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

import '../bottom_navigation_bar_component.dart';

class CadastrarFilme extends StatefulWidget {
  @override
  _CadastrarFilmeState createState() => _CadastrarFilmeState();
}

class _CadastrarFilmeState extends State<CadastrarFilme> {
  final myControllerIdioma = TextEditingController();
  final myControllerAvaliacao = TextEditingController();
  final myControllerDuracao = TextEditingController();
  final myControllerGenero = TextEditingController();
  final myControllerAno = TextEditingController();
  final myControllerClassificacao = TextEditingController();
  final myControllerNome = TextEditingController();

  OutlineInputBorder _inputBorderDecoration() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)));
  }

  void _salvarFilme() {
    MyApp.filmes.add(FilmeEntity(
        myControllerNome.text,
        myControllerClassificacao.text,
        myControllerAno.text,
        myControllerGenero.text,
        myControllerDuracao.text,
        myControllerIdioma.text,
        myControllerAvaliacao.text));
    Navigator.pushReplacementNamed(context, "/home", arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
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
                Text("CADASTRAR FILME",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                TextField(
                    controller: myControllerNome,
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
                        hintText: "Nome",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 5),
                TextField(
                    controller: myControllerClassificacao,
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
                        hintText: "Classificao etária",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 5),
                TextField(
                    controller: myControllerAno,
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
                        hintText: "Ano de lançamento",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 5),
                TextField(
                    controller: myControllerGenero,
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
                        hintText: "Gênero",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 5),
                TextField(
                    controller: myControllerDuracao,
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
                        hintText: "Duração",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 5),
                TextField(
                    controller: myControllerIdioma,
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
                        hintText: "Idioma",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 5),
                TextField(
                    controller: myControllerAvaliacao,
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
                        hintText: "Avaliação (0 ~ 5)",
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic))),
                const SizedBox(height: 10),
                SizedBox(
                    width: 150.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () => _salvarFilme(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          shape: StadiumBorder()),
                      child: const Text("Salvar",
                          style:
                              TextStyle(fontSize: 23, fontFamily: "Raleway")),
                    )),
              ],
            ),
          ),
        )),
        bottomNavigationBar: BottomNavigationBarComponent(context));
  }
}
