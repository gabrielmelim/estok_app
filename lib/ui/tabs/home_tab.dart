import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 38),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 14, right: 18, top: 24),
            child: Card(
              color: Color.fromRGBO(231, 239, 242, 1),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 81,
                width: 320,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 22, right: 180),
                      child: Text(
                        'BEBIDAS HEINEKEN',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'TESTE',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
        selectedItemColor: Color.fromRGBO(88, 53, 94, 1),
        backgroundColor: Color.fromRGBO(246, 245, 245, 1),
        onTap: _onItemTapped,
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 26),
        child: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Add',
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(88, 53, 94, 1),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

