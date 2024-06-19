import 'package:flutter/material.dart';

class Mensagem extends StatefulWidget {
  final String texto;
  final Color cor;
  const Mensagem({
    super.key,
    required this.texto,
    required this.cor,
  });

  @override
  State<Mensagem> createState() => _MensagemState();
}

class _MensagemState extends State<Mensagem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: widget.cor,
      ),
      width: 250,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: Text(
            widget.texto,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
