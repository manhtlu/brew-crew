import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/models/brew.dart';
import 'package:mtlu_brew_crew/screens/home/settings_form.dart';
import 'package:mtlu_brew_crew/services/auth.dart';
import 'package:provider/provider.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      child: Scaffold(
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
                label: Text('Sign out')),
            TextButton.icon(
                onPressed: () {
                  _showSettingPanel();
                },
                icon: Icon(Icons.settings),
                label: Text('setting'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
