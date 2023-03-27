import 'package:flutter/material.dart';
import 'package:estok_app_treino/widgets/custom_text_form_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroEstoque extends StatefulWidget {


  @override
  State<CadastroEstoque> createState() => _CadastroEstoqueState();
}

class _CadastroEstoqueState extends State<CadastroEstoque> {


  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.value = maskFormatter.updateMask(mask: "##-##-##-##");
    super.initState();
  }
  var maskFormatter = new MaskTextInputFormatter(mask: '####-####', filter: { "#": RegExp(r'[0-9]') });
  String dropdownValue='Caixa';
  List<String> list = ['Caixa', 'Teste'];



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
          'NOVO\nESTOQUE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(88, 53, 94, 1.0),
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat',
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
                  padding: const EdgeInsets.only(left:30.0, bottom: 10.0),
                  child: Text('Descrição',
                  style: TextStyle(
                    fontSize: 16,
                      color: Color.fromRGBO(88, 53, 94, 1.0),
                    fontFamily: 'Montserrat',

                  ),),
                ),
              Column(

                children: [

                  CustomTextFormField(
                    controller: controller,
                    labelText: 'Descrição do Estoque',
                    inputWidth: 313,

                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Data de entrada',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(88, 53, 94, 1.0),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 14.0, top: 10.0),
                          child: CustomTextFormField(
                            labelText: '12/12/2012',
                            inputWidth: 130,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Column(
                      children: [
                        Text(
                          'Data de Validade',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(88, 53, 94, 1.0),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 14.0, top: 10.0),
                          child: CustomTextFormField(
                            labelText: '12/12/2012',
                            inputWidth: 151,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
                

              ),
                 Text('Tipo'),
                 Container(
                   margin: EdgeInsets.only(left: 26, right: 24),
                    width: 20,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.red, //                   <--- border color
                       width: 1.0,
                     ),
                     borderRadius: BorderRadius.all(
                         Radius.circular(15.0) //                 <--- border radius here
                     ),

                   ),
                   child: Center(
                     child: DropdownButton<String>(

                      value: dropdownValue,

                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),

                      onChanged: (String value) {
                      // This is called when the user selects an item.
                      setState(() {
                      dropdownValue = value;
                      });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(88, 53, 94, 1.0),

                      ),),
                      );
                      }).toList(),
                      ),
                   ),
                 ),


            ],
          ),
        ),
      ),
      
    );
    
  }
}
