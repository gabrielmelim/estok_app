import 'package:flutter/material.dart';


class MyBottomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(246, 245, 245, 1.0),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon( Icons.home,),
          label:  'Home',
        ),


        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check) ,
          label: 'Histórico',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_sharp),
          label: 'Perfil',
        ),
      ],
    );

  }
}
