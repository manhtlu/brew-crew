import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            obscureText: true,
            onChanged: (value) => setState(() => _currentName = value),
            validator: (value) => value.isEmpty ? 'Enter a name' : null,
          ),
          SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars ?? '0',
            onChanged: (val) {
              setState(() => _currentSugars = val);
            },
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
          ),
          // slider
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink[400])),
              onPressed: () async {
                print(_currentName);
                print(_currentStrength);
                print(_currentSugars);
              },
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
