import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/servicos/estado_global.dart';

class Usuario extends StatefulWidget {
  const Usuario({super.key});

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: EstadoGlobal.estadoGlobal,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor:
                  EstadoGlobal.estadoGlobal.valor ? Colors.blue : Colors.red,
              title: const Text('Registar'),
            ),
            body: ListView(children: EstadoGlobal.estadoGlobal.minhaLista()),
          );
        });
  }
}
