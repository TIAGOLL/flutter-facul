import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  final Map<String, AssetImage> _opcoesImagem = {
    "pedra": AssetImage("imagens/pedra.png"),
    "papel": AssetImage("imagens/papel.png"),
    "tesoura": AssetImage("imagens/tesoura.png"),
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuário: " + escolhaUsuario);

    setState(() {
      this._imagemApp = _opcoesImagem[escolhaApp]!;
    });

    switch (escolhaApp) {
      case "pedra":
        if (escolhaUsuario == "papel") {
          setState(() {
            this._mensagem = "Parabéns, você ganhou!";
          });
        }
        if (escolhaUsuario == "pedra") {
          setState(() {
            this._mensagem = "Empate!";
          });
        }
        if (escolhaUsuario == "tesoura") {
          setState(() {
            this._mensagem = "Você perdeu!";
          });
        }
      case "papel":
        if (escolhaUsuario == "papel") {
          setState(() {
            this._mensagem = "Empate!";
          });
        }
        if (escolhaUsuario == "pedra") {
          setState(() {
            this._mensagem = "Você perdeu!";
          });
        }
        if (escolhaUsuario == "tesoura") {
          setState(() {
            this._mensagem = "Parabéns, você ganhou!";
          });
        }
      case "tesoura":
        if (escolhaUsuario == "papel") {
          setState(() {
            this._mensagem = "Você perdeu!";
          });
        }
        if (escolhaUsuario == "pedra") {
          setState(() {
            this._mensagem = "Parabéns, você ganhou!";
          });
        }
        if (escolhaUsuario == "tesoura") {
          setState(() {
            this._mensagem = "Empate!";
          });
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Image(image: this._imagemApp),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "imagens/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "imagens/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "imagens/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
