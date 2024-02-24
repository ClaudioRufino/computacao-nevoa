import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/views/pages/principal/home.dart';
import 'package:sistema_inscricao/app/views/pages/principal/perfil.dart';
import 'package:sistema_inscricao/app/views/pages/principal/estado.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int indice = 0;

  final telas = [const Home(), const Sobre(), const Perfil()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 56, 97),
        body: IndexedStack(
          index: indice,
          children: telas,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indice,
          elevation: 10,
          onTap: (value) => {
            setState(
              () {
                indice = value;
              },
            )
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 24, 56, 97),
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: Color.fromARGB(255, 24, 56, 97),
              ),
              label: 'Estado',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 24, 56, 97),
              ),
              label: 'Perfil',
            )
          ],
        ),
      ),
    );
  }
}
