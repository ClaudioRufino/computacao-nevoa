// import 'dart:convert';

import 'package:sistema_inscricao/app/models/dados_pessoal/pessoal.dart';
// import 'package:http/http.dart' as http;

class DadosPessoaisAPI {
  /* Esse objecto Representa a minha API, que gerou os dados em JSON */
  Future<Pessoal?> dadosPessoais(String bi) async {
    //   var url = 'https://consulta.edgarsingui.ao/consultar/$bi';
    //   var response = await http.get(Uri.parse(url));

    //   if (response.statusCode == 200) {
    //     Map dados = json.decode(response.body);
    //     var pessoa = Pessoal(
    //         nome: utf8.decode(dados['name'].toString().codeUnits),
    //         dataNascimento: dados['data_de_nascimento'].toString(),
    //         nomePai: utf8.decode(dados['pai'].toString().codeUnits),
    //         nomeMae: utf8.decode(dados['mae'].toString().codeUnits),
    //         emitidoEm: dados['emitido_em'].toString());
    //     return pessoa;
    //   } else {
    return null;
    // }
  }

  Future<bool> existeBI(String bi) async {
    // var url = 'https://consulta.edgarsingui.ao/consultar/$bi';
    // var response = await http.get(Uri.parse(url));

    // if (response.statusCode == 200) {
    //   Map dado = json.decode(response.body);
    //   if (dado['error'] == false) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } else {
    //   return false;
    // }

    return true;
    //Para teste apenas quando não há net
  }
}
