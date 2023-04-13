import 'package:balance/Home/Exercises/components.dart';
import 'package:balance/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  bool _star = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: green,
          toolbarHeight: 65,
          expandedHeight: 300,
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(bottom: 10),
            centerTitle: true,
            title: Text(
              "Exercises",
              style: GoogleFonts.varelaRound(
                  fontSize: 32, color: white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: components.length,
              (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: black, width: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          components[index].icon,
                          color: green,
                          height: 30,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          components[index].title,
                          style: GoogleFonts.lato(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(children: [
                      const SizedBox(
                        height: 40,
                        width: 30,
                        child: VerticalDivider(
                          thickness: 0.3,
                          color: black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _star = !_star;
                            components[index].id = _star;
                          });
                        },
                        child: SvgPicture.asset(
                          height: 30,
                          components[index].id
                              ? 'Assets/Icons/star.svg'
                              : 'Assets/Icons/hollow-star.svg',
                        ),
                      ),
                    ]),
                  ]),
            );
          }),
        )
      ]),
    );
  }
}
