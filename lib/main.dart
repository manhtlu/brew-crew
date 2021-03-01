import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/models/authuser.dart';
import 'package:mtlu_brew_crew/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mtlu_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}