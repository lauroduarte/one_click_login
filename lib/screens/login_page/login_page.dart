import 'package:flutter/material.dart';
import 'sign_in_button.dart';
import '../../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(Buttons.Google, onPressed: () => onSignedIn(context) ),
              SignInButton(Buttons.Facebook,onPressed: () => onSignedIn(context) )
              ],
          ),
        ),
      ),
    );
  }

  static Function onSignedIn(BuildContext context){
    Navigator.pushNamed(context, FirstScreenRoute);
  }
}