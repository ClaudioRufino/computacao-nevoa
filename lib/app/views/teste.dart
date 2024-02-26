import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firestore Flutter'),
        ),
        body: const UserList(),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('usuarios').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        var usuarios = snapshot.data!.docs;
        List<Widget> userWidgets = [const Text('Ola mundo')];
        for (var usuario in usuarios) {
          var userData = usuario.data();
          var nome = userData['nome'];
          var email = userData['email'];
          // var urlFoto = userData['urlFoto'];

          userWidgets.add(
            ListTile(
              title: Text(nome),
              subtitle: Text(email),
              leading: const CircleAvatar(
                  // backgroundImage: NetworkImage(urlFoto),
                  ),
            ),
          );
        }

        return ListView(
          children: userWidgets,
        );
      },
    );
  }
}
