import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),//permite crear un layout
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Título de la App'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
      ),
      body: Center(
        child: Text(
          'Un componente del cuerpo de la App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.cyan,
            fontFamily: 'Ranchers',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Text('Click'),
        onPressed: null,
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}