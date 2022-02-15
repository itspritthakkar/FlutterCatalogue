import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';

// ignore: camel_case_types
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  bool changeButton = false;

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
            Text("Welcome$username!",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20.00),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Username",
                      fillColor: Colors.deepPurpleAccent.withOpacity(0.4),
                      filled: true,
                    ),
                    onChanged: (value) {
                      username = " " + value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 10.00),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Password",
                      fillColor: Colors.deepPurpleAccent.withOpacity(0.4),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20.00),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });

                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, AppRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 50 : 120,
                      height: 45,
                      alignment: Alignment.center,
                      child: changeButton ? const Icon(Icons.done, color: Colors.white,) : const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 10 : 8)),
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       // if (kDebugMode) {
                  //       //   print("Button pressed");
                  //       // }else{
                  //         Navigator.pushNamed(context, AppRoutes.homeRoute);
                  //       // }
                  //     },
                  //     child: const Text("Login"),
                  //   style: TextButton.styleFrom(minimumSize: const Size(120, 40), shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(30.0),
                  //   ),),
                  // )
                ],
              ),
            ),
          ],
      )),
    );
  }
}
