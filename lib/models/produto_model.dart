import 'package:estok_app/repository/api/produto_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class ProdutoModel extends Model {
  bool produto;

  static ProdutoModel of(BuildContext context) {
    return ScopedModel.of<ProdutoModel>(context);
  }

  void cadastrar(String nome, String descricao, double valorItem,
      double valorUnitario, int quantidade, String site,
      {VoidCallback onSuccess, VoidCallback onFail(String Message)}) async {
    produto = await ProdutoApi.instance
        .cadastrar(nome, descricao, valorItem, valorUnitario, quantidade, site);

    if (produto == false) {
      onFail('Falha ao cadastrar produto.');
    }

    onSuccess();
    print('Produto cadastrado com sucesso.');
  }
}
