import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 69;
    String position = "upndown";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App")
      ),
      body: Center(
        child: Text("We love $days referred by $position"),
      ),
      drawer: const Drawer(),
    );
  }
}
