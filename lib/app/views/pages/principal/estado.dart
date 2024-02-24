import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/servicos/autenticacao_servico/autenticacao_servico.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  final AutenticacaoServico _authServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  'ESTADO DE PAGAMENTO',
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
        const Divider(),
        const SizedBox(height: 250),
        Container(
          width: 360,
          height: 120,
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
                trailing: Icon(Icons.account_box, color: Colors.white38),
                title: Center(
                  child: Text(
                    'Estado de Pagamento',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                subtitle: Center(
                    child: Text('Pendente', style: TextStyle(fontSize: 16))),
              ),
            ],
          ),
        ),
      ]),
      // child: const Center(
      //   child: Text('Home'),
      // ),
    );
  }
}
