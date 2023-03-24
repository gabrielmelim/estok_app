import 'package:estok_app/models/usuario_model.dart';
import 'package:estok_app/ui/pages/home_page.dart';
import 'package:estok_app/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() {
  runApp(MyApp(UsuarioModel()));
}

class MyApp extends StatefulWidget {

  final UsuarioModel usuarioScopedModel;
  MyApp(this.usuarioScopedModel);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: widget.usuarioScopedModel,
      child: MaterialApp(
        title: "ESTOK APP",
        theme: ThemeData(
          fontFamily: "Montserrat",
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        //home: LoginPage(),
      ),
    );
  }
}
