import 'package:balance/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'tool.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final title = {
    1: "FUN EXERCISE",
    2: "OWN YOUR HEALTH",
  };
  final subTitle = {
    1: "You cannot always control what goes on the outside. But you always control what goes on the inside, Being your journey to a better life with peace and discover your soul.",
    2: "Your Diet Is A Bank Account. Good Food Choices Are Good Investments.",
  };

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  pages(id) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Image.asset('Assets/Images/one ($id).png'),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title[id]!,
            style: GoogleFonts.anton(color: purple, fontSize: 48),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            subTitle[id]!,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(color: Colors.black54, fontSize: 16),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        children: [
          pages(1),
          pages(2),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 4,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: const ExpandingDotsEffect(
                activeDotColor: purple,
                dotColor: purple,
                spacing: 10.0,
                dotHeight: 10.0,
                dotWidth: 10.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Permissions();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: Text(
                "NEXT",
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
