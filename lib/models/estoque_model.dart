import 'package:estok_app/entities/estoque.dart';
import 'package:estok_app/repository/api/estoque_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class EstoqueModel extends Model {
  bool estoque;

  static EstoqueModel of(BuildContext context) {
    return ScopedModel.of<EstoqueModel>(context);
  }

  void cadastrar(
      String descricao, String dataEntrada, String dataValidade, String tipo,
      {VoidCallback onSuccess, VoidCallback onFail(String Message)}) async {
    estoque = await EstoqueApi.instance
        .cadastrar(descricao, dataEntrada, dataValidade, tipo);

    if (estoque == false) {
      onFail('Falha ao criar estoque.');
    }

    onSuccess();
    print('Estoque criado com sucesso.');
  }
}
