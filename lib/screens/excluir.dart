import 'package:desafio/entities/filme.dart';
import 'package:desafio/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

import '../bottom_navigation_bar_component.dart';

class ExcluirFilme extends StatefulWidget {
  FilmeEntity movie;
  ExcluirFilme(this.movie);

  @override
  _ExcluirFilmeState createState() => _ExcluirFilmeState(movie);
}

class _ExcluirFilmeState extends State<ExcluirFilme> {
  FilmeEntity movie;
  _ExcluirFilmeState(this.movie);

  void _excluirFilme(context, FilmeEntity selectedMovie) {
    for (var movie in MyApp.filmes) {
      if (movie.id == selectedMovie.id) {
        MyApp.filmes.remove(movie);
        break;
      }
    }
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
              Text("EXCLUIR FILME",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
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
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black,
                    border: Border.all(color: Colors.black)),
                child: Text("Classificação etária: ${movie.classificacaoEtaria} anos",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
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
                width: MediaQuery.of(context).size.width,
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
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black,
                    border: Border.all(color: Colors.black)),
                child: Text("Duração: ${movie.duracao.toString()} minutos",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300)),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
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
                width: MediaQuery.of(context).size.width,
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
                    onPressed: () => _excluirFilme(context, movie),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        shape: StadiumBorder()),
                    child: const Text("Excluir",
                        style: TextStyle(fontSize: 23, fontFamily: "Raleway")),
                  )),
            ],
          ),
        ),
      )),
        bottomNavigationBar: BottomNavigationBarComponent(context));
  }
}
