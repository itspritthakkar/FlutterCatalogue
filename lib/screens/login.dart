import 'package:flutter/material.dart';

// ignore: camel_case_types
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Catalog App")
      ),
      body: const Center(
        child: Text("Login Page"),
      ),
      drawer: const Drawer(),
    );
  }
}
