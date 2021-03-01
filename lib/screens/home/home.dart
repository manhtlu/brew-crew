import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Sign out'))
        ],
      ),
    );
  }
}
