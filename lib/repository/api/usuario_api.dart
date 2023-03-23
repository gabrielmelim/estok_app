import 'dart:convert';
import 'package:estok_app/entities/usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioApi{

  static final UsuarioApi instance =  UsuarioApi._();
  UsuarioApi._();

  Future<Usuario> signIn(String username, String password) async{

    var encodeString = {
      "email": username,
      "senha": password
    };

    var encode = json.encode(encodeString);
    String url = 'http://54.90.203.92/auth/login';
    print("LOG[UsuarioAPI.signIn] - url $url");
    print("LOG[UsuarioAPI.signIn] - encode $encode");

    var response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: encode,
    );


    if(response.statusCode == 200){
      var responseData = json.decode(utf8.decode(response.bodyBytes));
      print("LOG[UsuarioAPI.signIn] - responseData $responseData");

      Usuario usuario = Usuario.fromJson(responseData['data']);
      print(usuario.toJson());
      print("LOG[UsuarioAPI.signIn] - usuario $usuario");


      return usuario;

    }else{
      return null;
    }

  }

}