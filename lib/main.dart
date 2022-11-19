import 'package:desafio/screens/cadastrarFilme.dart';
import 'package:desafio/screens/cadastrarUser.dart';
import 'package:flutter/material.dart';

import 'entities/filme.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class User {
  final String user;
  final String email;
  final String password;

  const User({required this.user, required this.email, required this.password});
}

class MyApp extends StatelessWidget {
  // static const List<FilmeEntity> filmes = [new FilmeEntity(nome, classificacaoEtaria, anoLancamento, genero, duracao, idioma, avaliacao)];
  static List<User> users = [
    new User(user: "artur", email: "artur@email", password: "123")
  ];
  static List<FilmeEntity> filmes = [
    new FilmeEntity(
        "Avatar", "12", "2009", "Ficção Científica", "162", "Inglês", "4.4")
  ];

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/home": (context) => Home(),
        "/cadstrar": (context) => CadastrarUser(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myControllerLogin = TextEditingController();
  final myControllerPassword = TextEditingController();

  Future<void> _nextScreen(TextEditingController myControllerLogin,
      TextEditingController myControllerPassword) async {
    int count = 0;
    for (User user in MyApp.users) {
      if (user.email == myControllerLogin.text &&
          user.password == myControllerPassword.text) {
        count++;
        Navigator.pushReplacementNamed(context, "/home", arguments: {
          "login": user.user,
          "password": myControllerPassword.value.text
        });
        break;
      }
    }
    if (count == 0) {
      _showDialog();
    }
  }

  void _nextScreenCadastrar() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CadastrarUser()));
  }

  OutlineInputBorder _inputBorderDecoration() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)));
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Não encontrado"),
          content: const Text("Usuário não cadastrado ou não encontrado."),
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
                  TextField(
                      controller: myControllerLogin,
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
                              color: Colors.white,
                              fontStyle: FontStyle.italic))),
                  const SizedBox(height: 10),
                  TextField(
                      controller: myControllerPassword,
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
                              color: Colors.white,
                              fontStyle: FontStyle.italic))),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () => _nextScreen(
                                myControllerLogin, myControllerPassword),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[900],
                                shape: StadiumBorder()),
                            child: const Text("Sign in",
                                style: TextStyle(
                                    fontSize: 23, fontFamily: "Raleway")),
                          )),
                      const SizedBox(width: 40),
                      SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () => _nextScreenCadastrar(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[900],
                                shape: StadiumBorder()),
                            child: const Text("Sign up",
                                style: TextStyle(
                                    fontSize: 23, fontFamily: "Raleway")),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
