import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:estok_app_treino/entities/user.dart';

class UserApi {
  static final UserApi instance = UserApi._();
  UserApi._();

  Future<User> signIn(String email, String senha) async {
    final encodeString = {
      "email": email,
      "senha": senha,
    };
    final encode = json.encode(encodeString);
    final url = Uri.parse('http://54.90.203.92/auth/login');
    print('LOG[User.fromJson] - json: $json');
    print("LOG[UserApi.signIn] - url $url");
    print("LOG[UserApi.signIn] - encode $encode");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: encode,
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(utf8.decode(response.bodyBytes));
      print('LOG[UserApi.signIn] - responseData: $responseData');
      final user = User.fromJson(responseData['data']);
      print('LOG[UserApi.signIn] - user: $user');
      print('LOG[UserApi.signIn] - userJson: ${user.toJson()}');
      return user;
    }
  }
}
