import 'package:estok_app_treino/models/model_user.dart';
import 'package:estok_app_treino/ui/tabs/home_tab.dart';
import 'package:estok_app_treino/widgets/navigationbar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Define o índice da tab selecionada como 0
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(88, 53, 94, 1.0),
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: MyBottomNavigationBar(),
          drawer: SafeArea(
            child: Drawer(
              child: ListView(
                children: [


                      ScopedModelDescendant<ModelUser>(
                        builder: (BuildContext context, Widget child, ModelUser modelUser) {
                          return UserAccountsDrawerHeader(
                            currentAccountPicture: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
                            ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/drawer-bg-image.jpg'),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(Colors.transparent.withOpacity(0.3), BlendMode.colorBurn)

                                  ),
                              ),
                              accountName: Text(modelUser.user.nome ?? 'Usuário'),
                              accountEmail: Text(modelUser.user.email ?? 'usuario@email.com'),



                  );
                        }
                      ),
                  SizedBox(height: 15,),
                  ListTile(

                    leading: Icon(Icons.account_circle_sharp),
                    title: Text('Meu Perfil',  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromRGBO(88, 53, 94, 1.0)
                    ),

                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
                  ListTile(
                    leading: Icon(Icons.store_mall_directory),
                    title: Text('Estoques',  style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(88, 53, 94, 1.0)
                    ),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                    onTap: (){

                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.playlist_add_check),
                    title: Text('Histórico',  style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color.fromRGBO(88, 53, 94, 1.0)
                    ),),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                    onTap: (){

                    },

                  ),
                  SizedBox(
                    height: 130,
                  ),
                  SizedBox(
                    height: 43,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: RaisedButton(
                        elevation: 0,
                        color: Color.fromRGBO(88, 53, 94, 1.0),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide.none,
                        ),
                        child: Text('Sair',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                        onPressed: (){

                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Color.fromRGBO(88, 53, 94, 1.0),
              onPressed: () {

              },
              child: Icon(Icons.add),
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color.fromRGBO(88, 53, 94, 1.0),
            ),
            toolbarHeight: 147,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: Text(
                'ESTOK APP',
                style: TextStyle(
                    color: Color.fromRGBO(88, 53, 94, 1.0),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat'),
              ),
            ),
            bottom: TabBar(
              labelColor: Color.fromRGBO(88, 53, 94, 1.0),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(88, 53, 94, 1.0), width: 5.0),
                ),
              ),
              tabs: [
                // Usa a cor preta para a fonte da tab selecionada e a cor cinza para as outras tabs
                Tab(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'TODOS',
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Montserrat',
                          color: _selectedIndex == 0
                              ? Color.fromRGBO(88, 53, 94, 1.0)
                              : Color.fromRGBO(144, 159, 173, 1.0),
                          fontWeight: _selectedIndex == 0
                              ? FontWeight.w700
                              : FontWeight.w500),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Em Estoque',
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Montserrat',
                          color: _selectedIndex == 1
                              ? Color.fromRGBO(88, 53, 94, 1.0)
                              : Color.fromRGBO(144, 159, 173, 1.0),
                          fontWeight: _selectedIndex == 1
                              ? FontWeight.w700
                              : FontWeight.w500),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Em aviso',
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Montserrat',
                          color: _selectedIndex == 2
                              ? Color.fromRGBO(88, 53, 94, 1.0)
                              : Color.fromRGBO(144, 159, 173, 1.0),
                          fontWeight: _selectedIndex == 2
                              ? FontWeight.w700
                              : FontWeight.w500),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Em falta',
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'Montserrat',
                          color: _selectedIndex == 3
                              ? Color.fromRGBO(73, 80, 87, 1.0)
                              : Color.fromRGBO(144, 159, 173, 1.0),
                          fontWeight: _selectedIndex == 3
                              ? FontWeight.w700
                              : FontWeight.w500),
                    ),
                  ),

                ),

              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),

          body: Container(
            child: TabBarView(
              children: [


                HomeTab('Todos'),
                HomeTab('Em Estoque'),
                HomeTab('Em aviso'),
                HomeTab('Em falta')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
