import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
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
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'ESTADO DE PAGAMENTO',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
      // child: const Center(
      //   child: Text('Home'),
      // ),
    );
  }
}
