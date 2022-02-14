import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: camel_case_types
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                "assets/images/login.jpg",
                fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.00),
            const Text("Welcome!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.00),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username"
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password"
                    ),
                  ),
                  const SizedBox(height: 20.00),
                  ElevatedButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("Button pressed");
                        }
                      }, 
                      child: const Text("Login")
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
