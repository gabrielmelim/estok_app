import 'package:estok_app/entities/usuario.dart';
import 'package:estok_app/repository/api/usuario_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class UsuarioModel extends Model {

  Usuario usuario;

  static UsuarioModel of(BuildContext context) {
    return ScopedModel.of<UsuarioModel>(context);
  }

  void login(String username, String password,
      {VoidCallback onSuccess, VoidCallback onFail(String Message)}) async {
    //TODO informar a classe api os meus dados, obter esses dados, obter meu usuario

    usuario = await UsuarioApi.instance.signIn(username, password);

    if (usuario != null) {
      onSuccess();
    } else {
      onFail("Erro ao efetuar login para $username");
    }

  }
}