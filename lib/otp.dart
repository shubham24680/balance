import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
// import 'package:balance/home.dart';
import 'package:balance/tool.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Image.asset('Assets/Images/verification.jpg'),
              Text("OTP Verification",
                  style: GoogleFonts.anton(
                    fontSize: 32,
                  )),
              const SizedBox(height: 10),
              Text(
                "Thank you for registering with you. Please type the OTP shared to your mobile XXXXXXX123",
                style: GoogleFonts.lato(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Pinput(
                length: 6,
                showCursor: false,
                // onChanged: (value) {
                //   code = value;
                // },
                focusedPinTheme: PinTheme(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Home()),
                  // );
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP not received?",
                    style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushAndRemoveUntil(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const PhoneVerification();
                      // }), (route) => false);
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.blue),
                    child: Text(
                      "Resend",
                      style: GoogleFonts.varelaRound(
                          color: blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
