import 'package:flutter/material.dart';

class NoFoundRouteScreen extends StatelessWidget {
  const NoFoundRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Center(
          child: Text("Not Found this Route"),
        ),
      ),
    );
  }
}
