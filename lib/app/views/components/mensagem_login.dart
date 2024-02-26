import 'package:flutter/material.dart';

class MensagemLogin extends StatefulWidget {
  final String texto;
  final Color cor;
  const MensagemLogin({super.key, required this.texto, required this.cor});

  @override
  State<MensagemLogin> createState() => _MensagemLoginState();
}

class _MensagemLoginState extends State<MensagemLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: widget.cor,
          ),
          width: 370,
          height: 40,
          child: Center(
            child: Text(
              widget.texto,
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
