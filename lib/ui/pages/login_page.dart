
import 'package:estok_app/models/usuario_model.dart';
import 'package:estok_app/ui/pages/home_page.dart';
import 'package:estok_app/ui/validator/login_validator.dart';
import 'package:estok_app/ui/widgets/custom_text_form_field.dart';
import 'package:estok_app/ui/widgets/message.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginValidator {

  bool _isVisible = false;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final FocusNode _focusSenha = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Center(
            child: ListView(
              shrinkWrap: true,
               padding: const EdgeInsets.all(21),
                children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: 23),
                    child: Text(
                      "ESTOK APP",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(bottom: 54),
                    child: Text(
                      "Login",
                      textAlign:TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 21),
                    child: CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.text,
                      requestFocus: _focusSenha,
                      hintText: "Email",
                      validator: validateEmail,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(196, 196, 196, 1),
                        size: 22,
                      ),

                    ),
                  ),

                  CustomTextFormField(
                      controller: _senhaController,
                      keyboardType: TextInputType.text,
                      focusNode: _focusSenha,
                      hintText: "Senha",
                     validator: validateSenha,

                      prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(196, 196, 196, 1),
                      size: 22,
                    ),

                    sullfixIcon: GestureDetector(
                        child: Icon(
                          _isVisible ? Icons.visibility: Icons.visibility_off,
                          color: Color.fromRGBO(88, 53, 94, 1),
                        ),
                        onTap: (){
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                    obscureText: !_isVisible,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 38),
                    child: SizedBox(
                      height: 40,
                      child: RaisedButton(
                        elevation: 0,
                        onPressed: (){
                          _loginOnPressed(context);
                        },
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                         color: Color.fromRGBO(247, 242, 248, 1),
                        textColor: Color.fromRGBO(70, 62, 71, 1),
                        child: Text("ENTRAR"),

                      ),
                    ),
                  )
                ],
              ),

        ),
      ),

    );
  }
  void _loginOnPressed(BuildContext context){
    FocusScope.of(context).unfocus();
    if(!_formKey.currentState.validate()){
      return;
    }
    print("Login ${_emailController.text}");
    print("Senha ${_senhaController.text}");
    UsuarioModel.of(context).login(_emailController.text, _senhaController.text,
      onSuccess: (){
      Message.onSuccess(
          scaffoldKey: _scaffoldKey,
          message: 'Usuário logado com sucesso',
          seconds: 2,
          onPop: (value){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
              return HomePage();
            }));
          }
      );
        return;
      },
      onFail: (String message){
        Message.onFail(
            scaffoldKey: _scaffoldKey,
            message: message,
        );
        return;
      }
    );
  }
}
