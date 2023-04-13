import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import '../tool.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _currentValue = 18;
  bool tap = true;

  void press() {
    setState(() {
      tap = !tap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text("Select Prefernces",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.anton(
                    fontSize: 32,
                  )),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text("Which one are you?",
                  style: GoogleFonts.varelaRound(
                    fontSize: 24,
                  )),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => press(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: (tap) ? blue : lightBlue,
                      fixedSize: const Size(150, 200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'Assets/Images/pic (1).png',
                      ),
                      Text(
                        "Male",
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => press(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: (!tap) ? blue : lightBlue,
                      fixedSize: const Size(150, 200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'Assets/Images/pic (2).png',
                      ),
                      Text(
                        "Female",
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text("How old are you?",
                  style: GoogleFonts.varelaRound(
                    fontSize: 24,
                  )),
            ),
            const SizedBox(height: 20),
            Center(
              child: SvgPicture.asset(
                'Assets/Icons/downward.svg',
              ),
            ),
            NumberPicker(
              value: _currentValue,
              minValue: 1,
              maxValue: 120,
              itemCount: 3,
              axis: Axis.horizontal,
              textStyle: GoogleFonts.lato(fontWeight: FontWeight.bold),
              selectedTextStyle: GoogleFonts.lato(
                  color: blue, fontSize: 24, fontWeight: FontWeight.bold),
              onChanged: (value) => setState(() => _currentValue = value),
            ),
            SvgPicture.asset('Assets/Icons/upward.svg'),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const BMI();
                // }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  minimumSize: const Size.fromHeight(65),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text(
                "Continue",
                style: GoogleFonts.nunito(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
