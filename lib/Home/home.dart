import 'package:balance/Home/Steps/step_screen.dart';
import 'package:balance/Home/Steps/steps.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '/tool.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.user});

  final User user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User _currentUser;

  // Future<dynamic> Logout() async {
  //   await FirebaseAuth.instance.signOut();

  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => const OptionScreen(),
  //     ),
  //   );
  // }

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            expandedHeight: 80,
            backgroundColor: Colors.grey[100],
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Hello, ${_currentUser.displayName}!",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.yanoneKaffeesatz(
                          fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/Settings'),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('Assets/Images/anya.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Steps');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Steps(),
                    ),
                  );
                },
                childCount: 1,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
            ),
          )
        ],
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      //     child:
      //   ),
      // ),
    );
  }
}
// body: WillPopScope(
//   onWillPop: () async {
//     final logout = await showDialog<bool>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Are you sure?'),
//           content: const Text('Do you want to logout from this App'),
//           actionsAlignment: MainAxisAlignment.spaceBetween,
//           actions: [
//             TextButton(
//               onPressed: () => Logout(),
//               child: const Text('Yes'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, false);
//               },
//               child: const Text('No'),
//             ),
//           ],
//         );
//       },
//     );
//     return logout!;
// },
//   child: Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'NAME: ${_currentUser.displayName}',
//         ),
//         const SizedBox(height: 16.0),
//         Text(
//           'EMAIL: ${_currentUser.email}',
//         ),
//         const SizedBox(height: 16.0),
//         ElevatedButton(
//           onPressed: () async {
//             await FirebaseAuth.instance.signOut();

//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => const OptionScreen(),
//               ),
//             );
//           },
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(green),
//           ),
//           child: const Text('Sign out'),
//         ),
//       ],
//     ),
//   ),
// ),
