import 'package:estok_app/models/produto_model.dart';
import 'package:estok_app/ui/pages/home_page.dart';
import 'package:estok_app/ui/widgets/custom_text_form_field.dart';
import 'package:estok_app/ui/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CadastroProdutoPage extends StatefulWidget {
  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _siteController = TextEditingController();

  final valorItemController = new MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: 'R\$ ',
  );

  final valorUnitarioController = new MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: 'R\$ ',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
          },
          color: Color.fromRGBO(88, 53, 94, 1),
        ),
        title: Text(
          "NOVO PRODUTO",
          style: TextStyle(
              color: Color.fromRGBO(88, 53, 94, 1),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(247, 242, 248, 1),
      ),
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Center(
            child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(21),
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 30),
                child: Text(
                  "Nome",
                  style: TextStyle(fontSize: 18),
                )),
            CustomTextFormField(
              controller: _nomeController,
              keyboardType: TextInputType.text,
              hintText: "Heineken original",
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 21),
                child: Text(
                  "Descrição",
                  style: TextStyle(fontSize: 18),
                )),
            CustomTextFormField(
              controller: _descricaoController,
              keyboardType: TextInputType.text,
              maxLines: 7,
              hintText: "Uma das melhores marcas em uma casa só",
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 21),
                child: Text(
                  "Valor item",
                  style: TextStyle(fontSize: 18),
                )),
            CustomTextFormField(
              controller: valorItemController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              hintText: "R\$ 45,00",
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 21),
                child: Text(
                  "Valor unitário",
                  style: TextStyle(fontSize: 18),
                )),
            CustomTextFormField(
              controller: valorUnitarioController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              hintText: "R\$ 7,50",
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 21),
                child: Text(
                  "Quantidade",
                  style: TextStyle(fontSize: 18),
                )),
            CustomTextFormField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              hintText: "10",
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 21),
                child: Text(
                  "Site",
                  style: TextStyle(fontSize: 18),
                )),
            CustomTextFormField(
              controller: _siteController,
              keyboardType: TextInputType.url,
              hintText: "Informe a url",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 40,
                child: RaisedButton(
                  elevation: 0,
                  onPressed: () {
                    _cadastrarOnPressed(context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Color.fromRGBO(247, 242, 248, 1),
                  textColor: Color.fromRGBO(70, 62, 71, 1),
                  child: Text("CADASTRAR"),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  void _cadastrarOnPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState.validate()) {
      return;
    }

    print(valorItemController.numberValue);

    ProdutoModel.of(context).cadastrar(
        _nomeController.text,
        _descricaoController.text,
        valorItemController.numberValue,
        valorUnitarioController.numberValue,
        int.parse(_quantidadeController.text),
        _siteController.text, onSuccess: () {
      Message.onSuccess(
          scaffoldKey: _scaffoldKey,
          message: 'Estoque criado com sucesso',
          seconds: 2,
          onPop: (value) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (BuildContext context) {
            //   return HomePage();
            // }));
          });
      return;
    }, onFail: (String message) {
      Message.onFail(
        scaffoldKey: _scaffoldKey,
        message: message,
      );
      return;
    });
  }
}
