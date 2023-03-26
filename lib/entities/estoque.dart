class Estoque {
  int id;
  String descricao;
  int quantidadeTotal;
  String dataEntrada;
  String dataValidade;
  String tipo;
  String statusEstoque;

  Estoque(
      {this.id,
      this.descricao,
      this.quantidadeTotal,
      this.dataEntrada,
      this.dataValidade,
      this.tipo,
      this.statusEstoque});

  factory Estoque.fromJson(Map<String, dynamic> json) {
    return Estoque(
      id: (json['id'] as num).toInt(),
      descricao: (json['descricao'] as String),
      quantidadeTotal: (json['quantidade_total'] as num).toInt(),
      dataEntrada: (json['data_entrada'] as String),
      dataValidade: (json['data_validade'] as String),
      tipo: (json['tipo'] as String),
      statusEstoque: (json['status_estoque'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": this.id,
      "descricao": this.descricao,
      "quantidade_total": this.quantidadeTotal,
      "data_entrada": this.dataEntrada,
      "data_validade": this.dataValidade,
      "tipo": this.tipo,
      "status_estoque": this.statusEstoque
    };
  }
}
