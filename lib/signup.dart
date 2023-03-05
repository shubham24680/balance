import 'package:balance/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication.dart';
import 'validator.dart';
import 'tool.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _name = FocusNode();
  final _email = FocusNode();
  final _password = FocusNode();
  final _confirmPassword = FocusNode();

  bool _isprocessing = false;
  bool _obscure = true;

  Future register() async {
    setState(() {
      _isprocessing = true;
    });

    if (formKey.currentState!.validate() &&
        _passwordController.text == _confirmPasswordController.text) {
      User? user = await Auth.registerUsingEmailPassword(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      setState(() {
        _isprocessing = false;
      });

      if (user != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home(user: user)),
            (route) => false);
      }
    }

    setState(() {
      _isprocessing = false;
    });
  }

  field(id) {
    Map<int, TextEditingController> control = {
      1: _nameController,
      2: _emailController,
      3: _passwordController,
      4: _confirmPasswordController,
    };
    Map<int, FocusNode> node = {
      1: _name,
      2: _email,
      3: _confirmPassword,
      4: _password,
    };
    Map<int, String> hint = {
      1: "FULL NAME",
      2: "EMAIL ADDRESS",
      3: "PASSWORD",
      4: "CONFIRM PASSWORD",
    };
    Map<int, TextInputType> keyboard = {
      1: TextInputType.name,
      2: TextInputType.emailAddress,
      3: TextInputType.visiblePassword,
      4: TextInputType.visiblePassword,
    };

    visibility() {
      setState(() {
        _obscure = !_obscure;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint[id]!,
          style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextFormField(
          cursorColor: blue,
          obscureText: (id == 4)
              ? _obscure
              : (id == 3)
                  ? true
                  : false,
          controller: control[id],
          focusNode: node[id],
          keyboardType: keyboard[id],
          validator: (value) {
            switch (id) {
              case 1:
                return Validator.validateName(name: value);
              case 2:
                return Validator.validateEmail(email: value);
              case 3:
                return Validator.validatepassword(password: value);
              case 4:
                return Validator.validatepassword(password: value);
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[150],
            suffixIcon: (id == 4)
                ? GestureDetector(
                    onTap: () => visibility(),
                    child: Icon(
                      (_obscure)
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
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: red),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: red),
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
    return GestureDetector(
      onTap: () {
        _name.unfocus();
        _email.unfocus();
        _password.unfocus();
        _confirmPassword.unfocus();
      },
      child: Scaffold(
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      field(1),
                      const SizedBox(height: 20),
                      field(2),
                      const SizedBox(height: 20),
                      field(3),
                      const SizedBox(height: 20),
                      field(4),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _isprocessing
                    ? const Center(
                        child: CircularProgressIndicator(color: blue))
                    : ElevatedButton(
                        onPressed: () => register(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blue,
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
                  onPressed: () {},
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
                      "Already a memeber?",
                      style:
                          GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/Login');
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.blue),
                      child: Text(
                        "Login now",
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
      ),
    );
  }
}
