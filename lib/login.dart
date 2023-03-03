import 'package:balance/home.dart';
import 'package:balance/signup.dart';
import 'package:balance/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscure = true;

  field(id) {
    Map<int, TextEditingController> control = {
      1: email,
      2: password,
    };
    Map<int, String> hint = {
      1: "EMAIL ADDRESS",
      2: "PASSWORD",
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
          obscureText: (id == 2) ? obscure : false,
          cursorColor: blue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[150],
            suffixIcon: (id == 2)
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
                      color: blue,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: blue),
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
                "Login",
                style: GoogleFonts.anton(color: Colors.black, fontSize: 32),
              ),
              const SizedBox(height: 30),
              field(1),
              const SizedBox(height: 20),
              field(2),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Home();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    minimumSize: const Size.fromHeight(65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Text(
                  "Log in",
                  style: GoogleFonts.nunito(fontSize: 24),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.blue),
                  child: Text(
                    "Forgot password?",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.varelaRound(
                        color: blue, fontWeight: FontWeight.bold),
                  ),
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
                  //   return const OTPScreen();
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    style: TextButton.styleFrom(foregroundColor: Colors.blue),
                    child: Text(
                      "Register now",
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
