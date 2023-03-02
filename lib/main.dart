import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'options.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.anton(color: Colors.white, fontSize: 40),
          displaySmall: GoogleFonts.lato(color: Colors.white, fontSize: 16),
        ),
      ),
      home: const OptionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
