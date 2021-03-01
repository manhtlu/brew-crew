import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/screens/authenticate/register.dart';
import 'package:mtlu_brew_crew/screens/authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) return Register(toggleView: toggleView);

    return SignIn(toggleView: toggleView);
  }
}
