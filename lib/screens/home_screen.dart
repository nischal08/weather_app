import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
              child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.green,
          child: Text("hello"),
        ),
      ),
    );
  }
}
