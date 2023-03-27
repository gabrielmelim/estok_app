import 'package:estok_app/entities/estoque.dart';
import 'package:estok_app/repository/api/estoque_api.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EstoqueModel extends Model{

  Future<List<Estoque>> futureEstoques;

  static EstoqueModel of(BuildContext context) {
    return ScopedModel.of<EstoqueModel>(context);
  }

  setState(){
    notifyListeners();
  }

  Future<void> fetch() async {
    futureEstoques = EstoqueApi.instance.getAll();

    setState();
  }

}