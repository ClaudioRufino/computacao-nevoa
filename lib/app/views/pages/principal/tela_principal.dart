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
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 20, 47, 82),
        // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
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
              Icons.home_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline, color: Colors.white),
            activeIcon: Icon(Icons.info),
            label: 'Estado',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.white),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          )
        ],
      ),
    );
  }
}
