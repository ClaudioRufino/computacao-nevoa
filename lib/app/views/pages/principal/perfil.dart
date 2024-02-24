import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/controller/perfil_controller.dart';
import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // var caminho = 'images/logo.png';

  var perfilController = PerfilController();
  final AutenticacaoServico _authServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: perfilController,
      builder: (context, child) => SizedBox(
        width: double.infinity,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 70,
            alignment: Alignment.bottomLeft,
            color: const Color.fromARGB(255, 24, 56, 97),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PERFIL DO CANDIDATO',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _authServico.sair();
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 90,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(perfilController.getCaminho()),
                    maxRadius: 30,
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: ListTile(
                    title: Text(
                      'Cláudio Rufino Milonga de Carvalho',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    subtitle: Text(
                      'Dados Pessoais',
                      style: TextStyle(color: Colors.white24),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      perfilController.mudarFoto();
                    },
                    child: const Text(
                      'Editar',
                      style: TextStyle(
                        height: 2,
                        color: Colors.white,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
            width: 380,
            height: 420,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 221, 97, 88),
                    Color.fromARGB(255, 238, 112, 28)
                  ]),
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            child: ListView(
              children: const [
                ListTile(
                  trailing: Icon(Icons.bookmark, color: Colors.white38),
                  title: Text(
                    'Média',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('15-05-98'),
                ),
                ListTile(
                  trailing: Icon(Icons.date_range, color: Colors.white38),
                  title: Text(
                    'Nascimento',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('15-05-98'),
                ),
                ListTile(
                  trailing: Icon(Icons.man, color: Colors.white38),
                  title: Text(
                    'Nome do pai',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('Rufino de Carvalho'),
                ),
                ListTile(
                  trailing: Icon(Icons.woman, color: Colors.white38),
                  title: Text(
                    'Nome da mãe',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('Mosalina Milonga'),
                ),
                ListTile(
                  title: Text(
                    'Curso Principal',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('Informática'),
                  trailing: Icon(Icons.school, color: Colors.white38),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
