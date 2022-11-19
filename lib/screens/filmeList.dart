import 'package:desafio/entities/filme.dart';
import 'package:desafio/main.dart';
import 'package:flutter/material.dart';

import '../bottom_navigation_bar_component.dart';
import 'editar.dart';
import 'excluir.dart';
import 'exibir.dart';


class TableList extends StatelessWidget {

  MovieAction movieAction;

  TableList(this.movieAction);

  void _nextScreen(context, FilmeEntity selectedMovie) {
    for (var movie in MyApp.filmes) {
      if (movie.nome == selectedMovie.nome) {
        switchCase(context, movie);
      }
    }
  }

  switchCase(context, FilmeEntity movie) {
    switch (movieAction) {
      case MovieAction.SHOW:
        _nextScreenExibirFilme(context, movie);
        break;
      case MovieAction.UPDATE:
        _nextScreenEditarFilme(context, movie);
        break;
      case MovieAction.REMOVE:
        _nextScreenExcluirFilme(context, movie);
        break;
    }
  }

  void _nextScreenExibirFilme(context, movie) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExibirFilme(movie)));
  }

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
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(children: <Widget>[
        SizedBox(height: 30.0),
        Container(
            padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 110.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 40.0,
            child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: List.generate(MyApp.filmes.length, (index) {
                  return _showTable(context, index);
                }
                ))),
      ]),
      bottomNavigationBar: BottomNavigationBarComponent(context));
  }

  Widget _showTable(context, index) {
      return _buildCard(MyApp.filmes[index], context);
  }

  Widget _buildCard(FilmeEntity filme, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
          onTap: () => _nextScreen(context, filme),
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black,
                    border: Border.all(color: Colors.black)),
                child: Text(filme.nome,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w300)),
              )
            ));
  }
}

enum MovieAction {
  SHOW,
  UPDATE,
  REMOVE
}

