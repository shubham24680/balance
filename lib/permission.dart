import 'package:balance/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tool.dart';

class Permissions extends StatelessWidget {
  Permissions({super.key});

  final title = {
    1: "Notification",
    2: "Telephone",
    3: "Physical activity",
  };
  final subTitle = {
    1: "New weekly healthy reminder, Motivational reminder and Personalised program",
    2: "Used to read your phone number so that people who have this number in their contacts can find you in Together",
    3: "Used to count your steps",
  };

  @override
  Widget build(BuildContext context) {
    page(id) {
      return Row(
        children: [
          SvgPicture.asset(
            'Assets/Icons/icon ($id).svg',
            color: orange,
            height: 30,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title[id]!,
                style: GoogleFonts.varelaRound(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                child: Text(
                  subTitle[id]!,
                  style: GoogleFonts.lato(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('Assets/Images/permission.jpg'),
            Text(
              "Required permissions",
              style: GoogleFonts.anton(color: Colors.black, fontSize: 32),
            ),
            page(1),
            page(2),
            page(3),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Signup();
                }));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: Text(
                "Allow",
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
