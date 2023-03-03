import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OptionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
