import 'package:flutter/material.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';

class Splash extends StatefulWidget {
  bool isLogin;

  Splash(this.isLogin);

  @override
  _Splash createState() => _Splash(isLogin);
}

class _Splash extends State<Splash> with SingleTickerProviderStateMixin {
  bool isLogin;

  _Splash(this.isLogin);

  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;
  Animation<double>? _scaleAnimation;
  Animation<double>? _rotationAnimation;
  Animation<double>? _positionAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _positionAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.5, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _animationController!.forward().then((_) {
      _deleteCacheDir();
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AnimatedBuilder(
              animation: _animationController!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _positionAnimation!.value * 1000),
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 100,
                      child: Image.asset("assets/images/app_logo.png")),
                );
              }),
        ));
  }

  Future<void> _deleteCacheDir() async {

      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          if (isLogin) {
            return Home();
          } else {
            return Login();
          }
        }),
            (route) => false,
      );

  }


}
