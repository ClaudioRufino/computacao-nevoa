import 'package:flutter/material.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      home: const LoginPage(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors
                .transparent, // Define a cor de splash globalmente como transparente
          ),
          child: child!,
        );
      },
    );
  }
}
