
class LoginValidator{

  String validateEmail(String value){

    if(value.isEmpty){
      return "Campo vazio";
    }
    return null;
  }

  String validateSenha(String value){
    if(value.isEmpty){
      return "Campo vazio";
    }
    if(value.length < 8){
      return "O campo deve conter no mínimo 8 caracteres";
    }
    return null;
  }

}