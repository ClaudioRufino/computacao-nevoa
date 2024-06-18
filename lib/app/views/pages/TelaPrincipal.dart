import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/views/pages/cloud.dart';
import 'package:sistema_inscricao/app/views/pages/edge.dart';
import 'package:sistema_inscricao/app/views/pages/local.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int indice = 0;

  final telas = [const Local(), const Edge(), const Cloud()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 300,
              height: 230,
              color: Colors.white,
              child: Image.asset(
                'images/logo.png',
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'INSTIC',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
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
