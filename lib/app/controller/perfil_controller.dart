import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PerfilController extends ChangeNotifier {
  // String caminho = 'images/logo.png';
  String caminho = 'images/logo.png';

  String getCaminho() {
    return caminho;
  }

  void mudarFoto() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);

    if (result != null) {
      caminho = 'images/isutic.jpg';
      // ignore: avoid_print
      print('Sucesso!');
    }
    notifyListeners();
  }
}
