import 'package:flutter/material.dart';
import 'package:personal_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ).copyWith(
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
        ),
        buttonTheme: ButtonTheme.of(context).copyWith(),
        fontFamily: 'Quicksand',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
