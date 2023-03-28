import 'package:estok_app/models/estoque_model.dart';
import 'package:estok_app/models/usuario_model.dart';
import 'package:estok_app/ui/pages/home_page.dart';
import 'package:estok_app/ui/pages/login_page.dart';
import 'package:estok_app/ui/pages/perfil_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() {
  runApp(MyApp(UsuarioModel(), EstoqueModel()));
}

class MyApp extends StatefulWidget {

  final UsuarioModel usuarioScopedModel;
  final EstoqueModel estoqueScopedModel;

  MyApp(this.usuarioScopedModel, this.estoqueScopedModel);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: widget.usuarioScopedModel,
      child: ScopedModel(
        model: widget.estoqueScopedModel,
        child: MaterialApp(
          title: "ESTOK APP",
          theme: ThemeData(
            fontFamily: "Montserrat",

            tabBarTheme: TabBarTheme(
              labelColor: Color.fromRGBO(88, 53, 94, 1),
              unselectedLabelColor: Color.fromRGBO(144, 159, 173, 1),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: PerfilPage(),
          // home: HomePage(),
          // home: LoginPage(),
        ),
      ),
    );
  }
}
