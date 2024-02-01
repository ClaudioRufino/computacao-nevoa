import 'package:flutter/material.dart';

class MensagemErro extends StatefulWidget {
  final String texto;
  const MensagemErro({super.key, required this.texto});

  @override
  State<MensagemErro> createState() => _MensagemErroState();
}

class _MensagemErroState extends State<MensagemErro> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 173, 17, 17),
        ),
        width: double.infinity,
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
