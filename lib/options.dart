import 'package:balance/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding.dart';
import 'tool.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          color: teal,
          image: DecorationImage(
            image: const AssetImage('Assets/Images/rope.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Title
            Text(
              "SET HIGH FITNESS GOAL",
              textAlign: TextAlign.center,
              style: GoogleFonts.anton(color: white, fontSize: 40),
            ),
            const SizedBox(height: 10),
            // Subtitle
            Text(
              "After you decide to start training we will make sure you get the best fitness program.",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Log in Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Login();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  minimumSize: const Size.fromHeight(65),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text(
                "Log in",
                style: GoogleFonts.nunito(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            // Sign up Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white10,
                  minimumSize: const Size.fromHeight(65),
                  side: const BorderSide(color: white, width: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text(
                "Try free",
                style: GoogleFonts.nunito(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
