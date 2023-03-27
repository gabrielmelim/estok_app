import 'package:estok_app_treino/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CadastroProduto extends StatefulWidget {
  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
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
        title: Text(
          'NOVO\nPRODUTO',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(88, 53, 94, 1.0),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text(
                  'Nome',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(88, 53, 94, 1.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: CustomTextFormField(
                  labelText: 'Heineken Original',
                ),
              ),
              Padding(
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(88, 53, 94, 1.0),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 14.0),
              ),
              CustomTextFormField(
                labelText: 'Uma das melhores marcas em\numa casa só',
                maxLines: 5,
              ),
              Padding(
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(
                    'Valor item',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(88, 53, 94, 1.0),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 14.0),
              ),
              CustomTextFormField(
                labelText: 'R\$45,00',
                keyboardType: TextInputType.number,
              ),
              Padding(
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(
                    'Valor Unitário',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(88, 53, 94, 1.0),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 14.0),
              ),
              CustomTextFormField(
                labelText: 'R\$7,50',
                keyboardType: TextInputType.number,
              ),
              Padding(
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(
                    'Quantidade',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(88, 53, 94, 1.0),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 14.0),
              ),
              CustomTextFormField(
                labelText: '10',
                keyboardType: TextInputType.number,
              ),
              Padding(
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Text(
                    'Site',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(88, 53, 94, 1.0),
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 14.0),
              ),
              CustomTextFormField(
                labelText: 'Informe a URL',
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: SizedBox(
                    width: 360,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {},
                      elevation: 0,
                      color: Color.fromRGBO(247, 242, 248, 1.0),
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      child: Text(
                        'CADASTRAR',
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
    );
  }
}
