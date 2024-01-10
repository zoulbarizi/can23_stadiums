import 'package:can23_stadiums/src/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ScrollController scrollCtrl = ScrollController();

  @override
  // void initState() {
  //   Timer.periodic(Duration(seconds: 5), (timer) {
  //     scrollCtrl.animateTo(
  //       scrollCtrl.position.extentAfter,
  //       duration: Duration(seconds: 1),
  //       curve: Curves.fastOutSlowIn,
  //     );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/can23.jpeg",
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            height: size.height * .55,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * .75,
              width: size.width,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Consts.color1.withOpacity(.9),
                    Consts.color1,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.3, 0.4],
                ),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Text(
                    "CÔTE D'IVOIRE",
                    style: GoogleFonts.lemon(fontSize: 35, color: Colors.white),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Consts.color2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "du 13 janvier au 11 février 2024",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consts.slogan(),
                  const SizedBox(height: 30),
                  SwipeButton(
                    thumb: const Icon(
                      Icons.double_arrow_rounded,
                      color: Colors.white,
                    ),
                    activeThumbColor: Consts.color2,
                    inactiveTrackColor: Consts.color2,
                    activeTrackColor: Colors.white,
                    onSwipeEnd: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (c) => const HomeView()),
                        (route) => false,
                      );
                    },
                    child: const Text("Glissez pour passer ..."),
                  ),
                  const SizedBox(height: 50),
                  Consts.akwabaText().animate().fade().scale(),
                  const SizedBox(height: 20),
                ],
              ).animate().slideY(duration: const Duration(seconds: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
