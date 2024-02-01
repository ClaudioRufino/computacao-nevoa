class Curso {
  late String nome;

  Curso._({
    required this.nome,
  });

  static final Curso instancia = Curso._(
    nome: 'nome',
  );

  String getNome() {
    return nome;
  }
}
