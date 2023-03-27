import 'package:estok_app_treino/models/model_user.dart';
import 'package:estok_app_treino/ui/pages/home_page.dart';
import 'package:estok_app_treino/widgets/custom_text_form_field.dart';
import 'package:estok_app_treino/widgets/message.dart';
import 'package:estok_app_treino/widgets/validator/login_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginValidator {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  final FocusNode _focusSenha = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ESTOK APP',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 34,
                        color: Color.fromRGBO(73, 80, 87, 1.0),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(73, 80, 87, 1.0)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: CustomTextFormField(
                        controller: _loginController,
                        hintText: "Email",
                        validator: validateLogin,
                        requestFocus: _focusSenha,
                        obscureText: false,
                        icon: Icon(Icons.person),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: CustomTextFormField(
                        focusNode: _focusSenha,
                        hintText: "Senha",
                        obscureText: true,
                        validator: validateSenha,
                        controller: _senhaController,
                        icon: Icon(Icons.lock),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: SizedBox(
                          width: 360,
                          height: 45,
                          child: RaisedButton(
                            onPressed: () {
                              _loginOnPressed(context);
                            },
                            elevation: 0,
                            color: Color.fromRGBO(247, 242, 248, 1.0),
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                            ),
                            child: Text(
                              'ENTRAR',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(88, 53, 94, 1.0)),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _loginOnPressed(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState.validate()) {
      return;
    }

    ModelUser.of(context).login(
      _loginController.text,
      _senhaController.text,
      onSuccess: () {
        Message.onSuccess(
            scaffoldKey: _scaffoldKey,
            message: 'Usuário logado com sucesso',
            seconds: 2,
            onPop: (value) {
              print("Login ${_loginController.text}");
              print("Senha ${_senhaController.text}");
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return HomePage();
              }),);
            }
            );
        return;
      },
    onFail: (String message) {
    String errorMessage = message ?? 'Não foi possível fazer login. Tente novamente.';
    Message.onFail(scaffoldKey: _scaffoldKey, message: errorMessage);
    return;
    },


    );



  }
}
