import 'package:flutter/material.dart';
// import 'package:sistema_inscricao/app/views/pages/home.dart';
import 'package:sistema_inscricao/app/views/pages/login.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:http/http.dart' as http;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
  // print('Assincrono');
  // bool valor = await existeBI('ola');
  // print(valor);
}

// Future<bool> existeBI(String bi) async {
//   // var url = 'https://jsonplaceholder.typicode.com/todos/1';
//   var url = 'https://consulta.edgarsingui.ao/consultar/$bi';
//   var response = await http.get(Uri.parse(url));
//   if (response.statusCode == 200) {
//     return true;
//   } else {
//     return false;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData.light(),
      home: const LoginPage(),
      // home: const Home(),
    );
  }
}
