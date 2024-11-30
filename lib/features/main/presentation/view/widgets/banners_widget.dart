import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../generated/assets.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget({super.key});

  @override
  State<BannersWidget> createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 211,
              // width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff8515CD),
                    Color(0xff0A41CD),
                  ])),
            ),
            Positioned(
              bottom: -110,
              child: SizedBox(
                height: 161,
                width: 360,
                child: CarouselSlider(
                    items: [
                      Image.asset(
                        Assets.imagesBanner,
                        height: 161,
                        width: 360,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        Assets.imagesCandyLog,
                        height: 161,
                      )
                    ],
                    options: CarouselOptions(
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, a) {
                        pageIndex = index;
                        setState((){});
//0
                        //1
                      },
                      scrollDirection: Axis.horizontal,
                    )),
              ),
            ),
            Positioned(
              top: 42,
              child: Image.asset(
                Assets.imagesCandyLog,
                height: 83,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 115,
        ),
        Center(
          child: SmoothPageIndicator(
            count: 2,
            effect: ExpandingDotsEffect(
                dotWidth: 6,
                dotHeight: 6,
                activeDotColor: AppColors.mainColor), // your preferred effect
            onDotClicked: (index) {},
            controller: PageController(initialPage: pageIndex),
          ),
        )
      ],
    );
  }
}
