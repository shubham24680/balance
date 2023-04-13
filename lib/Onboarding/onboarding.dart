import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../tool.dart';

class Activity {
  String title;
  String subtitle;
  Activity({required this.title, required this.subtitle});
}

List<Activity> activity = [
  Activity(
    title: "FUN EXERCISE",
    subtitle:
        "You cannot always control what goes on the outside. But you always control what goes on the inside, Being your journey to a better life with peace and discover your soul.",
  ),
  Activity(
    title: "OWN YOUR HEALTH",
    subtitle:
        "Your Diet Is A Bank Account. Good Food Choices Are Good Investments.",
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController(initialPage: 0);
  int _activePage = 0;

  pages(id) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Image.asset('Assets/Images/one (${id + 1}).png'),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            activity[id].title,
            style: GoogleFonts.anton(color: purple, fontSize: 48),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            activity[id].subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(color: black, fontSize: 16),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            _activePage = value;
          });
        },
        itemCount: activity.length,
        itemBuilder: (context, index) {
          return pages(index % activity.length);
        },
      ),
      bottomSheet: Container(
        color: white,
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SmoothPageIndicator(
              controller: _controller,
              count: activity.length,
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
                if (_activePage + 1 != activity.length) {
                  _controller.animateToPage(_activePage + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  Navigator.pushNamed(context, '/Permission');
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: Text(
                (_activePage + 1 != activity.length ? "NEXT" : "SIGN UP"),
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
