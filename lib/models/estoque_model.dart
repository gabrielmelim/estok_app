import 'package:estok_app/entities/estoque.dart';
import 'package:estok_app/repository/api/estoque_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class EstoqueModel extends Model {
  Estoque estoque;

  static EstoqueModel of(BuildContext context) {
    return ScopedModel.of<EstoqueModel>(context);
  }

  void listar(
      {VoidCallback onSuccess, VoidCallback onFail(String Message)}) async {
    estoque = await EstoqueApi.instance.listar();

    if (estoque != null) {
      onSuccess();
      print('Estoques listados com sucesso.');
    } else {
      onFail('Falha ao listar Estoques.');
    }
  }
}
