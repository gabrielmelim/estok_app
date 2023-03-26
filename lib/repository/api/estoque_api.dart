import 'dart:convert';

import 'package:estok_app/entities/estoque.dart';
import 'package:http/http.dart' as http;

class EstoqueApi {
  static final EstoqueApi instance = EstoqueApi._();
  EstoqueApi._();

  Future<Estoque> listar() async {
    String url = 'http://54.90.203.92/estoques';
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk4MDE5NDQsInN1YiI6IjIiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0In0.cUhN8dLW4EqjRIxY4Hu3eDSDGWgx0fPsfXYP5phwREw";

    print("LOG[EstoqueApi] - url $url");
    print("LOG[EstoqueApi] - token $token");

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(utf8.decode(response.bodyBytes));

      List<dynamic> data = responseData['data'];

      print("LOG[EstoqueApi] - data $data");

      Map<String, dynamic> map = {};
      Estoque estoque;
      final mapped = data.map((element) => Estoque.fromJson(element));

      print(estoque.toJson());
      print("LOG[EstoqueApi] - usuario $estoque");

      return estoque;
    } else {
      return null;
    }
  }
}
