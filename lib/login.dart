import 'package:balance/validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'authentication.dart';
import 'home.dart';
import 'tool.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _email = FocusNode();
  final _password = FocusNode();

  bool _isprocessing = false;
  bool _obscure = true;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home(user: user)));
    }
    return firebaseApp;
  }

  // Future login() async {

  // }

  field(id) {
    Map<int, TextEditingController> control = {
      1: _emailController,
      2: _passwordController,
    };
    Map<int, FocusNode> node = {
      1: _email,
      2: _password,
    };
    Map<int, String> hint = {
      1: "EMAIL ADDRESS",
      2: "PASSWORD",
    };
    Map<int, TextInputType> keyboard = {
      1: TextInputType.emailAddress,
      2: TextInputType.visiblePassword,
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
          obscureText: (id == 2) ? _obscure : false,
          controller: control[id],
          focusNode: node[id],
          keyboardType: keyboard[id],
          validator: (value) {
            switch (id) {
              case 1:
                return Validator.validateEmail(email: value);
              case 2:
                return Validator.validatepassword(password: value);
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[150],
            suffixIcon: (id == 2)
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
        _email.unfocus();
        _password.unfocus();
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
                  "Login",
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
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                FutureBuilder(
                  future: _initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _isprocessing
                          ? const Center(
                              child: CircularProgressIndicator(color: blue),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                _email.unfocus();
                                _password.unfocus();

                                if (formKey.currentState!.validate()) {
                                  print("success");
                                  setState(() {
                                    _isprocessing = true;
                                  });

                                  User? user =
                                      await Auth.signInUsingEmailPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );

                                  setState(() {
                                    _isprocessing = false;
                                  });

                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home(user: user)));
                                  }
                                }
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
                            );
                    }
                    return const CircularProgressIndicator(color: blue);
                  },
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
                      "Not a member?",
                      style:
                          GoogleFonts.varelaRound(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/Signup');
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
      ),
    );
  }
}
