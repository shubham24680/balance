import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tool.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  bool obscure = true;

  field(id) {
    Map<int, TextEditingController> control = {
      1: name,
      2: email,
      3: phone,
      4: password,
    };

    Map<int, String> hint = {
      1: "FULL NAME",
      2: "EMAIL ADDRESS",
      3: "PHONE",
      4: "PASSWORD",
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint[id]!,
          style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: control[id],
          obscureText: (id == 4) ? obscure : false,
          cursorColor: green,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[150],
            suffixIcon: (id == 4)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(
                      (obscure)
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: green,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: green),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        )
      ],
    );
  }

  divider() {
    return Expanded(
      child: Divider(
        thickness: 0.5,
        color: Colors.grey[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: GoogleFonts.anton(color: Colors.black, fontSize: 32),
              ),
              const SizedBox(height: 30),
              field(1),
              const SizedBox(height: 20),
              field(2),
              const SizedBox(height: 20),
              field(3),
              const SizedBox(height: 20),
              field(4),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    minimumSize: const Size.fromHeight(65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Text(
                  "Sign up",
                  style: GoogleFonts.nunito(fontSize: 24),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or continue with",
                      style: GoogleFonts.lato(color: Colors.black54),
                    ),
                  ),
                  divider(),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return verify[id];
                  // }));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "Assets/Icons/google.svg",
                      height: 30,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Sign up with Google",
                      style: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a memeber?",
                    style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    child: Text(
                      "Login now",
                      style: GoogleFonts.varelaRound(
                          color: green, fontWeight: FontWeight.bold),
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
