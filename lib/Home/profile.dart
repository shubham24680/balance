import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/tool.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final User? _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('Assets/Images/anya.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Anya",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${_user!.email}",
                style: const TextStyle(
                  color: black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Row(
                  children: [
                    const Icon(Icons.thermostat),
                    Column(
                      children: const [
                        Text(
                          "70Kg",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.thermostat),
                    Column(
                      children: const [
                        Text(
                          "70Kg",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.thermostat),
                    Column(
                      children: const [
                        Text(
                          "70Kg",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
