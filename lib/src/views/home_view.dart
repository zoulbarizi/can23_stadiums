import 'package:can23_stadiums/src/utils/my_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/stadium.dart';
import 'stadium_content.dart';

import 'image_slider.dart';
import 'animated_pages.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late PageController _pageController;
  List<Stadium> stadiums = MyData.stadiums;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final reversedMovieList = stadiums.reversed.toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Stack(
              children: reversedMovieList.map((stadium) {
                // return Image.asset("assets/images/joker.png");
                return ImageSlider(
                  pageValue: pageValue,
                  image: stadium.image,
                  index: stadium.index,
                );
              }).toList(),
            ),
            // ImageSlider(
            //   pageValue: pageValue,
            //   image: stadiums.first.image,
            //   index: stadiums.first.index - 1,
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .8,
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .add(const EdgeInsets.only(bottom: 10)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white.withOpacity(.7),
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0, 0.4, 0.5],
                  ),
                ),
                child: Image.asset(
                  "assets/images/CAN2023.png",
                  width: size.width * .6,
                ),
                // child: Row(
                //   children: [
                //     Image.asset(
                //       "assets/images/CAN2023.png",
                //       width: size.width * .5,
                //     ),
                //     Container(
                //       width: 2,
                //       height: 60,
                //       color: Consts.color2,
                //       margin: EdgeInsets.symmetric(horizontal: 10),
                //     ),
                //     Text(
                //       "5\nStades",
                //       textAlign: TextAlign.center,
                //       style: GoogleFonts.satisfy(
                //         fontSize: 45,
                //         height: .45,
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
            Container(
              height: size.height,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                // margin: EdgeInsets.only(bottom: 150),
                height: size.height * .4,
                child: AnimatedPages(
                  pageValue: pageValue,
                  pageController: _pageController,
                  pageCount: stadiums.length,
                  onPageChangeCallback: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: (index, _) => StadiumContent(
                    stadiums[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
