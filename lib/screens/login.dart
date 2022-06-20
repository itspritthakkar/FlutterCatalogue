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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, AppRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40.00),
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            Text(
                "Welcome$username!",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 20.00),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 42.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Username",
                        fillColor: Colors.deepPurpleAccent.withOpacity(0.2),
                        filled: true,
                      ),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Username cannot be empty";
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        if(value == ""){
                          username = "";
                        }else{
                          username = " " + value;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 10.00),
                  Container(
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Password",
                        fillColor: Colors.deepPurpleAccent.withOpacity(0.2),
                        filled: true,
                      ),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Password cannot be empty";
                      //   } else if(value.length < 8) {
                      //     return "Password must be atleast 8 characters long";
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(height: 20.00),
                  Material(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(changeButton ? 10 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOutCubic,
                        width: changeButton ? 60 : 330,
                        height: 55,
                        alignment: Alignment.center,
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                      ),
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
        ),
      )),
    );
  }
}
