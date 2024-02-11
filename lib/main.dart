import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:student_register/views/details_page.dart';
import 'package:student_register/views/home_page.dart';
import 'package:student_register/views/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomePage(),
        "/register": (context) => RegisterPage(),
        "/details": (context) => DetailsPage(),
        "/edit": (context) => RegisterPage(),
      },
    );
  }
}
