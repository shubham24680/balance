import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'gender.dart';
import 'login.dart';
import 'onboarding.dart';
import 'permission.dart';
import 'signup.dart';
import 'options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/Options': (_) => const OptionScreen(),
        '/Onboarding': (_) => const OnboardingScreen(),
        '/Permission': (_) => Permissions(),
        '/Signup': (_) => const Signup(),
        '/Login': (_) => const Login(),
        '/Gender': (_) => const Gender(),
      },
      home: const OptionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
