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

  // @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 56, 97),
      body: IndexedStack(
        index: indice,
        children: telas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: indice,
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 20, 47, 82),
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
              color: Colors.white,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            label: 'Estado',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Perfil',
          )
        ],
      ),
    );
  }
}
