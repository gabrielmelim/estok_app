import 'dart:convert';
import 'package:http/http.dart' as http;

class ProdutoApi {
  static final ProdutoApi instance = ProdutoApi._();
  ProdutoApi._();

  Future<bool> cadastrar(String nome, String descricao, double valorItem,
      double valorUnitario, int quantidade, String site) async {
    try {
      String url = 'http://54.90.203.92/estoques/12/produtos/';
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2Nzk5NTcyNDQsInN1YiI6IjIiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0In0.Mj5AP5SU-zdizZO8-At6wMqIiLkC3mXiDg5938yCC1g";

      var encodeString = {
        "nome": nome,
        "descricao": descricao,
        "imagem": '/xtudo_suco.jpeg',
        "valor_item": valorItem,
        "valor_unitario": valorUnitario,
        "quantidade": quantidade,
        "site": site
      };

      print(quantidade.runtimeType);

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
      print('LOG[ProdutoAPI.cadastrar] - erro $erro');
    }
  }
}
