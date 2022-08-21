import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 22;
    String name = 'Intehab Gull';
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
            "Gulli App",
            style: TextStyle(
              color: Colors.black,
            ),
        ),
      ),
      body: Center(
        child: Text("Welcome $name for $days i will be urs"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
