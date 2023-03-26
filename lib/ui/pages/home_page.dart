import 'package:estok_app/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(88, 53, 94, 1)),
        backgroundColor: Color.fromRGBO(247, 242, 248, 1),
        title: Text('ESTOK APP',
          style: TextStyle(
            color: Color.fromRGBO(88, 53, 94, 1)
          ),
        ),
        centerTitle: true,
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 60),
          child: Container(
            margin: EdgeInsets.only(top: 16),
            child: TabBar(
              indicatorColor: Color.fromRGBO(88, 53, 94, 1),
              controller: _tabController,

              tabs: [
                Tab(text: 'TODOS',),
                Tab(text: 'Em estoque',),
                Tab(text: 'Em aviso',),
                Tab(text: 'Em falta',),
              ],
            ),
          ),
        ),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(color: Colors.grey),
          Container(color: Colors.red),
          Container(color: Colors.amber),
          Container(color: Colors.blue),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              ScopedModelDescendant<UsuarioModel>(
                builder: (BuildContext context, Widget child, UsuarioModel usuarioModel) {
                  return UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage('https://raw.githubusercontent.com/gabrielmelim/imgs/main/FlutterIndra/Ellipse%209.png'),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/back_account.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.colorBurn)
                        ),
                      ),
                      accountName: Text(usuarioModel.usuario.nome ?? 'Usuario'),
                      accountEmail: Text(usuarioModel.usuario.email ?? 'usuario@email.com'),
                  );
                }
              ),
              SizedBox(height: 15),
              ListTile(
                 leading:Icon(Icons.account_circle),
                title: Text('Meu Perfil',
                style: TextStyle(
                  color: Color.fromRGBO(88, 53, 94, 1),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),

              ListTile(
                leading:Icon(Icons.store),
                title: Text('Estoques',
                  style: TextStyle(
                    color: Color.fromRGBO(88, 53, 94, 1),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),

              ListTile(
                leading:Icon(Icons.playlist_add_check),
                title: Text('Historico',
                  style: TextStyle(
                    color: Color.fromRGBO(88, 53, 94, 1),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
