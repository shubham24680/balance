import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'signup.dart';
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
    pages(id) {
      return Row(
        children: [
          SvgPicture.asset(
            'Assets/Icons/icon ($id).svg',
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
                      color: black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('Assets/Images/permission.jpg'),
            Text(
              "Required permissions",
              style: GoogleFonts.anton(color: Colors.black, fontSize: 32),
            ),
            for (int index = 1; index <= title.length; index++) pages(index),
            const PermissionHandlerScreen()
          ],
        ),
      ),
    );
  }
}

class PermissionHandlerScreen extends StatefulWidget {
  const PermissionHandlerScreen({super.key});
  @override
  State<PermissionHandlerScreen> createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  @override
  void initState() {
    super.initState();
    permissionServiceCall();
  }

  permissionServiceCall() async {
    PermissionStatus status = await Permission.activityRecognition.request();

    if (status == PermissionStatus.granted) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/Signup');
    }

    if (status == PermissionStatus.denied) {
      const AlertDialog(
        title: Text("Alert"),
        content: Text(
            "These permission are required to open the application. Please allow it."),
      );
    }
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => permissionServiceCall(),
      style: ElevatedButton.styleFrom(
          backgroundColor: orange,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          )),
      child: Text(
        "Allow",
        style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
