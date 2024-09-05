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
}
