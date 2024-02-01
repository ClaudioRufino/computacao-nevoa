import 'package:flutter/material.dart';

class MeuCard extends StatelessWidget {
  final double altura;
  final double largura;
  final Text texto;
  final double espaco;

  const MeuCard(
      {super.key,
      required this.largura,
      required this.altura,
      required this.texto,
      required this.espaco});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 70, top: espaco),
        width: largura,
        height: altura,
        child: texto);
  }
}
