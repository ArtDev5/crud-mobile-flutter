import 'package:desafio/entities/filme.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

import '../bottom_navigation_bar_component.dart';
import 'editar.dart';
import 'excluir.dart';
import 'filmeList.dart';

class ExibirFilme extends StatefulWidget {
  FilmeEntity movie;

  ExibirFilme(this.movie);

  @override
  _ExibirFilmeState createState() => _ExibirFilmeState(movie);
}

class _ExibirFilmeState extends State<ExibirFilme> {
  final myControllerLogin = TextEditingController();
  final myControllerPassword = TextEditingController();
  var myControllerTable = TextEditingController();
  FilmeEntity movie;

  _ExibirFilmeState(this.movie);

  void _nextScreenEditarFilme(context, movie) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EditarFilme(movie)));
  }

  void _nextScreenExcluirFilme(context, movie) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExcluirFilme(movie)));
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
                    Text("EXIBIR FILME",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text("Nome: ${movie.nome}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text("Classificação etária: ${movie
                          .classificacaoEtaria} anos",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text("Ano de lançamento: ${movie.anoLancamento}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text("Gênero: ${movie.genero}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text(
                          "Duração: ${movie.duracao.toString()} minutos",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text("Idioma: ${movie.idioma}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black,
                          border: Border.all(color: Colors.black)),
                      child: Text("Avaliação (0 ~ 5): ${movie.avaliacao}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () => _nextScreenEditarFilme(context, movie),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[900],
                              shape: StadiumBorder()),
                          child: const Text("Editar",
                              style: TextStyle(
                                  fontSize: 23, fontFamily: "Raleway")),
                        )),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () => _nextScreenExcluirFilme(context, movie),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[900],
                              shape: StadiumBorder()),
                          child: const Text("Excluir",
                              style: TextStyle(
                                  fontSize: 23, fontFamily: "Raleway")),
                        )),
                  ],
                ),
              ),
            )),
        bottomNavigationBar: BottomNavigationBarComponent(context));

  }
}
