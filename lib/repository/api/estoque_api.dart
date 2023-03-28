import 'dart:convert';
import 'package:http/http.dart' as http;

class EstoqueApi {
  static final EstoqueApi instance = EstoqueApi._();
  EstoqueApi._();

  Future<bool> cadastrar(String descricao, String dataEntrada,
      String dataValidade, String tipo) async {
    try {
      String url = 'http://54.90.203.92/estoques';
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk5NTY5NzksInN1YiI6IjIiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0In0.WxnfP13OUVz357uGL6472y-3lepe21G3UygyDUcgEto";

      var encodeString = {
        "descricao": descricao,
        "data_entrada": dataEntrada,
        "data_validade": dataValidade,
        "tipo": tipo
      };

      print('EncodeString: $encodeString');

      var encode = json.encode(encodeString);

      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: encode);

      if (response.statusCode != 200) {
        print('deu ruim');
        return false;
      }

      return true;
    } on Exception catch (erro) {
      print('LOG[EstoqueAPI.cadastrar] - erro $erro');
    }
  }
}
