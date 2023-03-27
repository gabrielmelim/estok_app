import 'package:estok_app_treino/models/model_user.dart';
import 'package:flutter/material.dart';
import 'package:estok_app_treino/widgets/custom_text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(88, 53, 94, 1.0),
            ),
            onPressed: () {
              //Lógica do drawer abrindo
            },
          ),
          toolbarHeight: 54,
          backgroundColor: Color.fromRGBO(247, 242, 248, 1.0),
          centerTitle: true,
          title: Text(
            'MEU PERFIL',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(88, 53, 94, 1.0),
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        body: ScopedModelDescendant<ModelUser>(
          builder: (BuildContext context, Widget child, ModelUser modelUser) {
            return Padding(
              padding: const EdgeInsets.only(top:28.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      size: 120,
                      color: Color.fromRGBO(148, 145, 145, 1.0),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Teste',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('data'),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
