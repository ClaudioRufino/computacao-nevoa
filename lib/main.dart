import 'package:flutter/material.dart';
// import 'package:sistema_inscricao/app/views/pages/home.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:sistema_inscricao/app/views/teste.dart';
import 'firebase_options.dart';
// import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData.light(),
      home: const LoginPage(),
      // home: const Teste(),
      // home: const Home(),
    );
  }
}
