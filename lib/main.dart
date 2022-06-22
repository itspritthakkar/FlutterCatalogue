import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/screens/cart.dart';
import 'package:myapp/utils/routes.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widgets/themes.dart';

import 'screens/home.dart';
import 'screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  final window = WidgetsBinding.instance.window;
  window.onPlatformBrightnessChanged = () {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDarkMode ? Brightness.light: Brightness.dark,
      statusBarColor: Colors.transparent, // transparent status bar
    ));
    WidgetsBinding.instance.handlePlatformBrightnessChanged();
  };
  window.onPlatformBrightnessChanged!();
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
