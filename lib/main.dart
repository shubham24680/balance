import 'package:balance/Home/Steps/step_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'Home/navigationbar.dart';
import 'Home/home.dart';
import 'Home/Exercises/exercise.dart';
import 'Home/profile.dart';
import 'Home/setting.dart';
import 'Onboarding/options.dart';
import 'Onboarding/onboarding.dart';
import 'Permissions/permission.dart';
import 'Authentication/login.dart';
import 'Authentication/signup.dart';
import 'Informations/gender.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final auth = FirebaseAuth.instance;
  bool _isprocessing = false;

  get user => FirebaseAuth.instance.currentUser;

  status() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          _isprocessing = true;
        });
      }
    });
  }

  @override
  void initState() {
    status();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/Options': (_) => const OptionScreen(),
        '/Login': (_) => const Login(),
        '/Onboarding': (_) => const OnboardingScreen(),
        '/Permission': (_) => const Permissions(),
        '/Signup': (_) => const Signup(),
        '/Gender': (_) => const Gender(),
        '/NavBar': (_) => const NavBar(),
        '/Home': (_) => Home(user: user),
        '/Steps': (_) => const StepScreen(),
        '/Exercise': (_) => const Exercise(),
        '/Profile': (_) => const Profile(),
        '/Settings': (_) => const Settings(),
      },
      home: _isprocessing ? const NavBar() : const OptionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
