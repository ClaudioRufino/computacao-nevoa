// ignore_for_file: unused_import, prefer_typing_uninitialized_variables
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sistema_inscricao/app/controllers/candidato_controller.dart';
import 'package:sistema_inscricao/app/repositories/db_repository.dart';

class PerfilController extends ChangeNotifier {
  late CandidatoController candidato;
  late DbRepository banco;

  PerfilController(CandidatoController c) {
    candidato = c;
    banco = DbRepository();
  }

  Future<String> fotoPerfil({required String campo}) async {
    return banco.getCampo(campo: campo);
  }

  Future<String> fotoPadrao() async {
    const caminhoFoto = '/fotos_de_perfil/fotoPadrao.png';
    Reference referenciaFoto =
        FirebaseStorage.instance.ref().child(caminhoFoto);
    String urlFoto = await referenciaFoto.getDownloadURL();
    return urlFoto;
  }

  Future<void> atualizar() async {
    FilePickerResult? foto = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);

    if (foto != null) {
      File file = File(foto.files.single.path!);

      // nome do arquivo do será armazenado no Cloud Storage do Firebase
      String nomeFoto = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); // Criamos um nome único para a nossa foto

      // Pega a extensão da foto para evitar que erros de carregamento de outros tipos de extensões.
      String nomeArquivo = foto.files.single.name;
      String extensao = nomeArquivo.split('.').last;

      if (extensao == 'jpg' ||
          extensao == 'JPG' ||
          extensao == 'png' ||
          extensao == 'PNG') {
        // Criando uma Referencia no nosso Cloud Storage

        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('fotos_de_perfil/$nomeFoto.$extensao');
        UploadTask uploadTask = storageReference.putFile(file);

        // Esperar que o carregamento da foto seja concluído para pegar a url
        await uploadTask.whenComplete(() async {
          String fotoUrl = await storageReference.getDownloadURL();
          candidato.setFotoPerfil(fotoUrl);
          notifyListeners();
        });
      }
    }
  }
}
