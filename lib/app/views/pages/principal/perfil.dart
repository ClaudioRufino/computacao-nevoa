import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/controller/candidato_controller.dart';
import 'package:sistema_inscricao/app/controller/perfil_controller.dart';
import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // var caminho = 'images/logo.png';

  var perfilController = PerfilController();
  final AutenticacaoServico _authServico = AutenticacaoServico();

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  CandidatoController candidato = CandidatoController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: perfilController,
      builder: (context, child) => SizedBox(
        width: double.infinity,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 80,
            alignment: Alignment.bottomLeft,
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
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
                    title: SelectOne(campo: 'nome'),
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
                        backgroundColor: Colors.white10,
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
            height: 480,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: ListView(
              children: const [
                // ignore: prefer_const_constructors
                ListTile(
                  trailing: Icon(Icons.bookmark, color: Colors.white70),
                  title: Text(
                    'MÉDIA',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: SelectOne(campo: 'media'),
                ),
                ListTile(
                  trailing: Icon(Icons.date_range, color: Colors.white70),
                  title: Text(
                    'NASCIMENTO',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: SelectOne(campo: 'dataNascimento'),
                ),
                ListTile(
                  trailing: Icon(Icons.man, color: Colors.white70),
                  title: Text(
                    'NOME DO PAI',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: SelectOne(campo: 'nomePai'),
                ),
                ListTile(
                  trailing: Icon(Icons.woman, color: Colors.white70),
                  title: Text(
                    'NOME DA MÃE',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: SelectOne(campo: 'nomeMae'),
                ),
                ListTile(
                  title: Text(
                    'PRIMEIRA OPÇÃO',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: SelectOne(campo: 'curso1'),
                  trailing: Icon(Icons.school, color: Colors.white70),
                ),
                ListTile(
                  title: Text(
                    'SEGUNDA OPÇÃO',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  subtitle: SelectOne(campo: 'curso2'),
                  trailing: Icon(Icons.school, color: Colors.white70),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SelectOne extends StatelessWidget {
  final String campo;
  const SelectOne({super.key, required this.campo});

  @override
  Widget build(BuildContext context) {
    // Referência para o documento no Firestore
    User? user = FirebaseAuth.instance.currentUser;

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('usuarios').doc(user!.uid);

    return StreamBuilder(
      stream: documentReference
          .snapshots(), // O stream é notificado sempre que o documento é alterado
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Mostrar um indicador de carregamento enquanto os dados estão sendo buscados
        }

        if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text('Documento não encontrado');
        }
        double tam = 13;
        Color cor = Colors.white54;

        // Extrair dados do documento
        Map<String, dynamic> data =
            snapshot.data?.data() as Map<String, dynamic>;
        late String nome;
        if (campo == 'curso1') {
          nome = data['curso'][0].toString();
        } else if (campo == "curso2") {
          nome = data['curso'][1].toString();
        } else if (campo == "nome") {
          tam = 16;
          cor = Colors.white;
          nome = data[campo].toString();
        } else {
          nome = data[campo].toString();
        }

        return Text(
          nome,
          style: TextStyle(color: cor, fontSize: tam),
        );
      },
    );
  }
}
