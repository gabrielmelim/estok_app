import 'package:flutter/material.dart';
import 'package:estok_app_treino/widgets/custom_text_form_field.dart';

class HistoricoPage extends StatefulWidget {
  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Text(
            'HISTÓRICO',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(88, 53, 94, 1.0),
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),

    );
  }
}
