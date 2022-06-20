import 'package:flutter/material.dart';
import 'package:myapp/screens/cart.dart';
import 'package:myapp/utils/routes.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widgets/themes.dart';

import 'screens/home.dart';
import 'screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: "/login",
      routes: {
        AppRoutes.homeRoute: (context) => const Home(),
        AppRoutes.loginRoute: (context) => const Login(),
        AppRoutes.cartRoute: (context) => const Cart(),
      },
    );
  }
}
