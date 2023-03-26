import 'package:estok_app/ui/pages/cadastro_produto.dart';
import 'package:estok_app/ui/pages/home_page.dart';
import 'package:estok_app/ui/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => CadastroProdutoPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTween = Tween(begin: Colors.grey);
    final animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    final animation = colorTween.animate(animationController);

    return Scaffold(
      backgroundColor: Color.fromRGBO(88, 53, 94, 1),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: animation,
          ),
        ],
      )),
    );
  }
}
