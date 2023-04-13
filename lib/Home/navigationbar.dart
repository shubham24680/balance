import 'package:balance/Home/Exercises/exercise.dart';
import 'package:balance/Home/home.dart';
import 'package:balance/Home/profile.dart';
import 'package:balance/tool.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItems {
  String hollow;
  String filled;
  String title;
  Widget destination;
  NavItems(
      {required this.hollow,
      required this.filled,
      required this.title,
      required this.destination});
}

User? user = FirebaseAuth.instance.currentUser;
List<NavItems> items = [
  NavItems(
      hollow: 'Assets/Icons/hollow_home.svg',
      filled: 'Assets/Icons/filled_home.svg',
      title: "Home",
      destination: Home(user: user!)),
  NavItems(
      hollow: 'Assets/Icons/hollow_goal.svg',
      filled: 'Assets/Icons/filled_goal.svg',
      title: "Exercises",
      destination: const Exercise()),
  NavItems(
      hollow: 'Assets/Icons/hollow_user.svg',
      filled: 'Assets/Icons/filled_user.svg',
      title: "Profile",
      destination: const Profile()),
];

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _activeIndex = 0;

  navbar(id) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(height: 25, items[id].filled),
      icon: SvgPicture.asset(height: 25, items[id].hollow),
      label: items[id].title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[_activeIndex].destination,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: green,
        selectedLabelStyle: GoogleFonts.lato(fontWeight: FontWeight.bold),
        unselectedLabelStyle: GoogleFonts.lato(),
        currentIndex: _activeIndex,
        items: [for (int i = 0; i < items.length; i++) navbar(i)],
        onTap: (value) {
          setState(() {
            _activeIndex = value;
          });
        },
      ),
    );
  }
}
