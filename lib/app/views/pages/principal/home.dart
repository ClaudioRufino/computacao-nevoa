import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/views/pages/principal/perfil.dart';
import 'package:sistema_inscricao/app/views/pages/principal/estado.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;

  final telas = [const Home(), const Perfil(), const Sobre()];

  int totalInscritos = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 90,
            alignment: Alignment.centerLeft,
            color: const Color.fromARGB(255, 24, 56, 97), //97
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'INFORMAÇÕES GERAIS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: 330,
            height: 60,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 221, 97, 88),
                    Color.fromARGB(255, 238, 112, 28)
                  ],
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Inscritos',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          child: Text('$totalInscritos'),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: Container(
              width: 320,
              height: 230,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 221, 97, 88),
                      Color.fromARGB(255, 238, 112, 28)
                    ]),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: ListView(children: [
                curso('Informática', 170, Icons.computer),
                curso('Telecomunicação', 10,
                    Icons.signal_wifi_statusbar_null_sharp),
                curso('Informática de Gestão', 170, Icons.computer_rounded),
              ]),
            ),
          ),
          Container(
            width: double.infinity,
            height: 184,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 24, 56, 97)),
                      child: Stack(
                        children: [
                          Center(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.file_copy),
                              label: const Text('Tópicos'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 24, 56, 97)),
                      child: Stack(
                        children: [
                          Center(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.file_copy),
                              label: const Text('Provas'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget curso(String curso, int total, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
    child: Container(
      width: 10,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 2,
              child: Icon(icon, color: const Color.fromARGB(255, 4, 35, 65))),
          Expanded(
              flex: 5,
              child: Text(
                curso,
                style: const TextStyle(color: Color.fromARGB(255, 4, 35, 65)),
              )),
          Expanded(flex: 1, child: Text(total.toString())),
        ],
      ),
    ),
  );
}
