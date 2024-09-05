import 'package:flutter/material.dart';
import 'package:jogo2/jogo.dart';

void main() {
  runApp(const MyApp(
    MaterialApp(
      home: jogo(),
      debugShowCheckedModeBanner: false,
    )
  ));
}

