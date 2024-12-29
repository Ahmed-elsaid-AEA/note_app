import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("routeName");
        },
        child: Text("data"),
      )),
    );
  }
}
