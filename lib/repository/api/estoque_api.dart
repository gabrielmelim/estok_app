import 'dart:convert';
import 'package:estok_app/entities/estoque.dart';
import 'package:http/http.dart' as http;

class EstoqueApi{

  static final EstoqueApi instance =  EstoqueApi._();
  EstoqueApi._();

  Future<List<Estoque>> getAll() async{
    List<Estoque> estoques;

    try{

      String url = 'http://54.90.203.92/estoques';
      String authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk4NzM3MzAsInN1YiI6IjIiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0In0.1VGGUrkt5fNuU6aQDtqbHcLAz0lvTkUNvfh9DBexXrs';
      print("LOG[EstoqueAPI.getAll] - url $url");

      var response = await http.get(url,
        headers: {'Content-Type': 'application/json','Authorization': authorization }
      );


      if(response.statusCode != 200){
        return null;
      }

      var responseData = json.decode(utf8.decode(response.bodyBytes));
      print("LOG[EstoqueAPI.signIn] - responseData $responseData");
      var data = responseData['data'];
      estoques = (data as List)?.map((json){
        return Estoque.fromJson(json as Map<String, dynamic>);
      })?.toList();
      return estoques;

    }on Exception catch(error){
      print("LOG[UsuarioAPI.signIn] - error: $error");
    }

  }

}