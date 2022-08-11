import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 22;
    String name = 'Intehab Gulli';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gulli App"),
      ),
      body: Center(
        child: Text("Wellcome $name for $days i will be urs"),
      ),
      drawer: const Drawer(),
    );
  }
}
