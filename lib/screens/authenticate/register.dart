import 'package:flutter/material.dart';
import 'package:mtlu_brew_crew/services/auth.dart';
import 'package:mtlu_brew_crew/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Register to Brew crew'),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  onChanged: (value) {
                    setState(() => email = value);
                  },
                  validator: (value) {
                    return value.isEmpty ? 'Enter an email' : null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() => password = value);
                  },
                  validator: (value) {
                    return value.length <= 7
                        ? 'Enter an password 6+ chars long'
                        : null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink[400])),
                    onPressed: () async {
                      setState(() => error = '');

                      if (_formKey.currentState.validate()) {
                        dynamic result = await _authService
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = 'Please supply a valid email');
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(height: 20),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}
