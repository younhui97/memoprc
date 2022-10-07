import 'package:flutter/material.dart';


void main() => runApp(Login());

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Scaffold(
        )//create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
