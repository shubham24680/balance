import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:balance/tool.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "STEPS",
            textAlign: TextAlign.start,
            style: GoogleFonts.lato(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        CircleAvatar(
            backgroundColor: green,
            radius: 45,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                'Assets/Icons/walking.svg',
                color: white,
                fit: BoxFit.contain,
                height: 80,
              ),
            )),
        const SizedBox(height: 20),
        Expanded(
          child: Text(
            "2,000",
            style: GoogleFonts.fredokaOne(fontSize: 28),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            height: 10,
            color: black,
            thickness: 0.5,
          ),
        ),
        Expanded(
          child: Text(
            "10,000",
            style: GoogleFonts.varelaRound(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
