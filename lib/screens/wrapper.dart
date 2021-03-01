import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/screens/authenticate/authenticate.dart';
import 'package:mtlu_brew_crew/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return home or auth screen
    return Authenticate();
  }
}
