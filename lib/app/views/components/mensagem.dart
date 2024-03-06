import 'package:flutter/material.dart';

class Mensagem extends StatefulWidget {
  final String texto;
  final Color cor;
  const Mensagem({super.key, required this.texto, required this.cor});

  @override
  State<Mensagem> createState() => _MensagemState();
}

class _MensagemState extends State<Mensagem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: widget.cor,
          // color: const Color.fromARGB(255, 173, 17, 17),
        ),
        width: 350,
        height: 50,
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
