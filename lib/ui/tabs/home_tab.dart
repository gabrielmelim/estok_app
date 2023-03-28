import 'package:estok_app/entities/estoque.dart';
import 'package:estok_app/models/estoque_model.dart';
import 'package:estok_app/ui/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatefulWidget {
  final String tipo;

  HomeTab(this.tipo);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _reload();
  }

  void _reload() {
    EstoqueModel.of(context).fetch(widget.tipo);
    // print(EstoqueModel.of(context).fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<EstoqueModel>(
          builder: (context, child, estoqueModel) {
            return FutureBuilder(
              future: estoqueModel.futureEstoques,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Estoque>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Não foi possível obter os dados necessários');
                  case ConnectionState.waiting:
                    return Center(
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(88, 53, 94, 1)),
                            strokeWidth: 5.0,
                          ),
                        )
                    );
                  default:
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 38),
                      itemCount: snapshot.data.length,
                      // snapshot.data != null ? snapshot.data.length:0,
                      //

                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 14, right: 18, top: 24),
                          child: Card(
                            color: Color.fromRGBO(231, 239, 242, 1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              height: 100,
                              width: 380,
                              child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12, left: 22,),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Text(
                                            // 'teste',
                                            snapshot.data[index].descricao,

                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                            ),
                                            maxLines: 2,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                           Padding(
                                            padding: const EdgeInsets.only(right: 37),
                                            child: Icon(

                                              Icons.circle,
                                              size: 14,
                                              color: corEstoque(snapshot.data[index].status_estoque),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),


                                  SingleChildScrollView(
                                    child: Flexible(
                                      flex: 0,
                                      child: Row(
                                          children: [
                                            Padding(
                                              padding:const EdgeInsets.only(left: 20, top: 15),
                                              child: Text(
                                                // 'TOTAL: 10000',
                                                'TOTAL: ${snapshot.data[index].quantidade_total.toString()}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(73, 80, 87, 1),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                softWrap: false,
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          

                                            Expanded(child:
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15, ),
                                              child: Text(
                                                // 'teste',
                                                'TIPO: ${snapshot.data[index].tipo.toString()}',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(73, 80, 87, 1),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                softWrap: false,
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(top: 15, right: 10 ),
                                              child: SizedBox(
                                                width: 90,
                                                child: Text(
                                                  // '\t\t\t\tEM\nESTOQUE',
                                                  snapshot.data[index].status_estoque,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: corEstoque(snapshot.data[index].status_estoque),
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                  softWrap: true,
                                                  // overflow: TextOverflow.ellipsis,
                                                ),
                                              )

                                            ),




                                            SizedBox(width: 0,)
                                          ]
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                }
              },
            );
          }
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            label: 'Historico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,

        // BOTTOM BAR CHAMANDO OUTRAS PÁGINAS
        // onTap: (int index){
        //   _onItemTapped(index);
        //   print(tabIndex);
        //   if(index == 0){
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => LoginPage()),
        //     );
        //   }if(index == 1){
        //
        //   }if(index == 2){
        //
        //   }
        // },

        selectedItemColor: Color.fromRGBO(88, 53, 94, 1),
        backgroundColor: Color.fromRGBO(246, 245, 245, 1),

      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 26),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add',
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(88, 53, 94, 1),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  Color corEstoque(String tipoEstoque){
    Color cor;
    if(tipoEstoque == 'EM ESTOQUE'){
      cor = Color.fromRGBO(58, 166, 55, 1);
    }
    if(tipoEstoque == 'EM AVISO'){
      cor = Color.fromRGBO(220, 199, 7, 1);
    }
    if(tipoEstoque == 'EM FALTA'){
      cor =  Color.fromRGBO(166, 55, 55, 1);
    }
    return cor;
  }
}