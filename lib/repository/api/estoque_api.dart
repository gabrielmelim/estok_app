import 'dart:convert';
import 'package:estok_app/entities/estoque.dart';
import 'package:http/http.dart' as http;

class EstoqueApi{

  static final EstoqueApi instance =  EstoqueApi._();
  EstoqueApi._();

  Future<List<Estoque>> getAll(String tipo) async{
    List<Estoque> estoques;
    print('tipo: ${tipo.toUpperCase()}');
    try{


      String url = 'http://54.90.203.92/estoques';
      String authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk5NjU3MTgsInN1YiI6IjIiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0In0.j5siXWa-yIHUjykaCudqr7iMGsaJs_Vx-ylntZOrDJQ';
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

      print(estoques);
      // if (tipo != "TODOS") {
      //   estoques = estoques.where((estoque) => estoque.status_estoque == tipo.toUpperCase()).toList();
      //   print('estoque filtrado: $estoques');
      // }

      return estoques;

    }on Exception catch(error){
      print("LOG[UsuarioAPI.signIn] - error: $error");
    }

  }

}