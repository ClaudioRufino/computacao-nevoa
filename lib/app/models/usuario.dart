abstract class Usuario {
  late String nome;
  late String email;
  late String senha;

  Usuario({required String nome, required String email, required String senha});

  String getNome() {
    return nome;
  }

  getEmail() {
    return email;
  }

  String getSenha() {
    return senha;
  }

  setNome(String nome) {
    nome = nome;
  }

  setEmail(String email) {
    email = email;
  }

  setSenha(String senha) {
    senha = senha;
  }
}
