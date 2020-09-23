import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/pantallas/autenticacion/register.dart';
import 'package:flutter_app/pantallas/autenticacion/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return StreamProvider<UserR>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Register(),
      ),
    );
  }
}