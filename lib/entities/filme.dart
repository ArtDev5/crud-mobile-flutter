import 'package:desafio/main.dart';

class FilmeEntity {
  late String id = MyApp.filmes.length.toString();
  final String nome;
  final String classificacaoEtaria;
  final String anoLancamento;
  final String genero;
  final String duracao;
  final String idioma;
  final String avaliacao;

  FilmeEntity(this.nome, this.classificacaoEtaria, this.anoLancamento,
      this.genero, this.duracao, this.idioma, this.avaliacao);
}