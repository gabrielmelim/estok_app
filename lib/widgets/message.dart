import 'package:flutter/material.dart';


class Message extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container();
  }


  static void onSuccess({@required GlobalKey<ScaffoldState> scaffoldKey , @required String message,  int seconds, Function onPop}){
    scaffoldKey.currentState.showSnackBar(
    SnackBar(content: Text(message),
    backgroundColor: Colors.blue[800],
    duration: Duration(seconds: seconds ?? 3),
));
    
    
    if(onPop != null){
      Future.delayed(Duration(seconds:  seconds ?? 3)).then(onPop);
    }
}


  static void onFail({@required GlobalKey<ScaffoldState> scaffoldKey , @required String message,  int seconds, Function onPop}){
    scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(message),
          backgroundColor: Colors.red[800],
          duration: Duration(seconds: seconds ?? 3),
        ));


    if(onPop != null){
      Future.delayed(Duration(seconds:  seconds ?? 3)).then(onPop);
    }
  }
}
