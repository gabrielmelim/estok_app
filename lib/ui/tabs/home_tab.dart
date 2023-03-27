import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  final String tipo;

  HomeTab(this.tipo);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color.fromRGBO(231, 239, 242, 1.0),
            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 81,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'BEBIDA HEINEKEN',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                        ),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 160,

                      ),

                      CircleAvatar(

                        radius: 5.0,
                        backgroundColor: Color.fromRGBO(58, 166, 55, 1.0),

                      ),

                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'TOTAL:',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(73, 80, 87, 1.0),
                        ),
                      ),
                      SizedBox(
                        width: 45.0, // largura específica do espaço
                      ),
                      Center(
                        child: Text(
                          'TIPO: PACOTE',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(73, 80, 87, 1.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60.0,
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          'EM ESTOQUE',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(58, 166, 55, 1.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
