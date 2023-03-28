import 'package:estok_app/models/estoque_model.dart';
import 'package:estok_app/ui/pages/home_page.dart';
import 'package:estok_app/ui/widgets/custom_text_form_field.dart';
import 'package:estok_app/ui/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CadastroEstoquePage extends StatefulWidget {
  @override
  _CadastroEstoquePageState createState() => _CadastroEstoquePageState();
}

class _CadastroEstoquePageState extends State<CadastroEstoquePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final dataDeEntradaController = MaskedTextController(mask: '00/00/0000');
  final dataDeValidadeController = MaskedTextController(mask: '00/00/0000');

  List<String> _options = ["Pacote", "Grade", "Caixa"];
  final FocusNode _focusDataEntrada = FocusNode();
  final FocusNode _focusDataValidade = FocusNode();
  final FocusNode _focusTipo = FocusNode();
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return CadastroEstoquePage();
            }));
          },
          color: Color.fromRGBO(88, 53, 94, 1),
        ),
        title: Text(
          "NOVO ESTOQUE",
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
            padding: const EdgeInsets.all(21),
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 30),
                  child: Text(
                    "Descrição",
                    style: TextStyle(fontSize: 18),
                  )),
              CustomTextFormField(
                requestFocus: _focusDataEntrada,
                controller: _descricaoController,
                keyboardType: TextInputType.text,
                hintText: "Descrição do estoque",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 21),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Data de entrada",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        CustomTextFormField(
                          requestFocus: _focusDataValidade,
                          focusNode: _focusDataEntrada,
                          controller: dataDeEntradaController,
                          keyboardType: TextInputType.datetime,
                          hintText: "12/12/2012",
                        ),
                      ],
                    )),
                    SizedBox(width: 16),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Data de validade",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        CustomTextFormField(
                          requestFocus: _focusTipo,
                          focusNode: _focusDataValidade,
                          controller: dataDeValidadeController,
                          keyboardType: TextInputType.datetime,
                          hintText: "12/12/2012",
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Tipo",
                    style: TextStyle(fontSize: 18),
                  )),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 110),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color.fromRGBO(88, 53, 94, 1),
                    width: 1,
                  ),
                ),
                child: DropdownButton<String>(
                  focusNode: _focusTipo,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                  ),
                  hint: Text(
                    'Selecione uma opção',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  value: _selectedOption,
                  items: _options.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      _selectedOption = newValue;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 50),
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
          ),
        ),
      ),
    );
  }

  void _cadastrarOnPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState.validate()) {
      return;
    }

    String converteDataFormatadaParaString(DateTime date) {
      date = DateTime.utc(date.year, date.month, date.day, 12);
      return DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS').format(date);
    }

    DateTime dataEntrada =
        DateFormat('dd/MM/yyyy').parse(dataDeEntradaController.text);
    DateTime dataValidade =
        DateFormat('dd/MM/yyyy').parse(dataDeValidadeController.text);

    String formattedDataEntrada = converteDataFormatadaParaString(dataEntrada);
    String formattedDataValidade =
        converteDataFormatadaParaString(dataValidade);

    EstoqueModel.of(context).cadastrar(
        _descricaoController.text,
        formattedDataEntrada,
        formattedDataValidade,
        _selectedOption, onSuccess: () {
      Message.onSuccess(
          scaffoldKey: _scaffoldKey,
          message: 'Estoque criado com sucesso',
          seconds: 2,
          onPop: (value) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
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
