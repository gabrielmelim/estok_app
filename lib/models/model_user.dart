

import 'package:estok_app_treino/entities/user.dart';
import 'package:estok_app_treino/repository/api/user/user_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class ModelUser extends Model{

  User user;
  
  static ModelUser of(BuildContext context){
    return ScopedModel.of<ModelUser>(context);
  }

  void login(String email, String senha, {VoidCallback onSuccess, VoidCallback onFail(String message)})
  async{


    user = await UserApi.instance.signIn(email, senha);


    if(user != null){
      onSuccess();
    }else{
      onFail('Email e senha não são compativeis $email');
    }
  }
}