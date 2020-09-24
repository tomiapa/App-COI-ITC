import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/screens/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/screens/wrapper.dart';
import 'package:flutter_app/models/UserR.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return StreamProvider<UserR>.value(
      value: AuthService().user, //<= Porque me haces esto AuthService
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}