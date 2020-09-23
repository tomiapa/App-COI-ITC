import 'package:flutter/material.dart';
import 'package:flutter_app/pantallas/autenticacion/auth.dart';
import 'package:flutter_app/compartidos/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView }); 

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey =  GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up to Application'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person), 
            label: Text('Sign In'),
            onPressed: (){
              widget.toggleView();
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars longs' : null,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () async {
                  // check the form for empty spots and validity
                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                  if (emailValid) {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWhitEmailAndPassword(email, password);
                      print(result);
                      if (result == null) {
                        setState(() => error = 'Write a valid email');
                      }
                    }
                  } else {
                    setState(
                        () => error = 'Write a valid email you moron!');
                  }
                },
                color: Colors.pink[300],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                )
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}