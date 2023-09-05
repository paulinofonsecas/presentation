class Programador {
  final int id;
  final String nome;
  final String especialidade;

  Programador(
    this.id,
    this.nome,
    this.especialidade,
  );

  factory Programador.make({
    required String nome,
    required String especialidade,
  }) {
    return Programador(
      0,
      nome,
      especialidade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'especialidade': especialidade,
    };
  }

  factory Programador.fromMap(Map<String, dynamic> map) {
    return Programador(
      map['id'] as int,
      map['nome'] as String,
      map['especialidade'] as String,
    );
  }
}
