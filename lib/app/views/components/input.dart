import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputEntrada extends StatelessWidget {
  final Icon icon;
  final String texto;
  final InputBorder errorBorder;
  final bool obscureText;
  final String Function(String?)? validator;
  final TextEditingController controlador;
  final TextInputType keyboardType;

  const InputEntrada({
    super.key,
    required this.texto,
    required this.icon,
    required this.controlador,
    required this.obscureText,
    this.validator,
    required this.keyboardType,
    required this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      // height: 60,
      child: TextFormField(
        obscureText: obscureText,
        controller: controlador,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: texto,
          alignLabelWithHint: true, // Centraliza o hintText
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          hintStyle: GoogleFonts.quicksand(
              color: Colors.white, fontStyle: FontStyle.italic),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: _bordasRedonda(),
          ),
          errorBorder: errorBorder,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: _bordasRedonda(),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.yellow,
            ),
            borderRadius: _bordasRedonda(),
          ),
        ),
      ),
    );
  }
}

BorderRadius _bordasRedonda() {
  return const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20));
}
