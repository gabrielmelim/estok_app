RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');


class LoginValidator {


  String validateLogin(String value){

    if(value.isEmpty){

      return "Campo não pode estar vazio";
    }
    if(!emailRegex.hasMatch(value)){

      return "O endereço de e-mail que você inseriu é inválido.";
    }

    return null;
  }


  String validateSenha (String value) {
    if (value.length < 8) {
      return "Campo deve conter no mínimo 8 caracteres";
    }

    if(value.isEmpty){
      return "Campo não pode estar vazio";
    }
    return null;
  }
}

