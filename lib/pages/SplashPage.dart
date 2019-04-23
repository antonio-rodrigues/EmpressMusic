import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  Animation _logoAnimation;
  AnimationController _logoController;

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    );

    _logoAnimation.addListener(() {
      if (_logoAnimation.status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed('/HomePage');
        return;
      }
      this.setState(() {});
    });

    _logoController.forward();
    super.initState();
  }

  Widget _buildLogo() {
    return Center(
      child: Container(
        height: _logoAnimation.value * 100,
        width: _logoAnimation.value * 100,
        child: Image.asset(
          'assets/images/AppLogo.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLogo(),
    );
  }
}
