import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/views/pages/principal_pages/home.dart';
import 'package:sistema_inscricao/app/views/pages/principal_pages/perfil.dart';
import 'package:sistema_inscricao/app/views/pages/principal_pages/estado.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: indice,
        children: telas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: indice,
        backgroundColor: const Color.fromARGB(255, 27, 88, 169),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
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
              size: 33,
            ),
            activeIcon: Icon(Icons.home),
            label: 'Local',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.border_inner,
              color: Colors.white,
              size: 33,
            ),
            activeIcon: Icon(Icons.border_all),
            label: 'Edge',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud_done_outlined,
              color: Colors.white,
              size: 33,
            ),
            activeIcon: Icon(Icons.cloud),
            label: 'Cloud',
          )
        ],
      ),
    );
  }
}
