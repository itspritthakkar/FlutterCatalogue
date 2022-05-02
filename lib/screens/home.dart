import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawer.dart';

// ignore: camel_case_types
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Catalog App",
        )
      ),
      body: const Center(
        child: Text(
          "Hey there! Welcome to home.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.deepPurple
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
