import 'package:flutter/material.dart';

import 'package:practice_flutter_app/Pages/home_page.dart';
import 'package:practice_flutter_app/Pages/login_page.dart';
import 'package:practice_flutter_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_flutter_app/widgets/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
