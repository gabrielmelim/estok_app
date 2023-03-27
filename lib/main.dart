import 'package:estok_app_treino/models/model_user.dart';
import 'package:estok_app_treino/ui/pages/cadastro_estoque_page.dart';
import 'package:estok_app_treino/ui/pages/cadastro_produto_page.dart';
import 'package:estok_app_treino/ui/pages/home_page.dart';
import 'package:estok_app_treino/ui/pages/login_page.dart';
import 'package:estok_app_treino/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp(ModelUser()));
}

class MyApp extends StatefulWidget {

  final ModelUser  userScopedModel;
  MyApp(this.userScopedModel);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MaterialColor customColor =

    MaterialColor(0xFFABCDEF, <int, Color>{
      50: Color(0xFFE1F1FF),
      100: Color(0xFFB6D4FE),
      200: Color(0xFF8AB6FD),
      300: Color(0xFF5E99FB),
      400: Color(0xFF3F84FA),
      500: Color(0xFF206FF9),
      600: Color(0xFF1C65F7),
      700: Color(0xFF1659F5),
      800: Color(0xFF124EF4),
      900: Color(0xFF0A3DEE),
    });

    return ScopedModel(
      model: widget.userScopedModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF495057, <int, Color>{
            50: Color.fromRGBO(73, 80, 87, 0.1),
            100: Color.fromRGBO(73, 80, 87, 0.2),
            200: Color.fromRGBO(73, 80, 87, 0.3),
            300: Color.fromRGBO(73, 80, 87, 0.4),
            400: Color.fromRGBO(73, 80, 87, 0.5),
            500: Color.fromRGBO(73, 80, 87, 0.6),
            600: Color.fromRGBO(73, 80, 87, 0.7),
            700: Color.fromRGBO(73, 80, 87, 0.8),
            800: Color.fromRGBO(73, 80, 87, 0.9),
            900: Color.fromRGBO(73, 80, 87, 1.0),
          }),
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
