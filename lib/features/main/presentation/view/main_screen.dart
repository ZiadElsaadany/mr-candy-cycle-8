import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy_cycle_8/core/utils/colors.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/widgets/banners_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../generated/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
BannersWidget(),


      ],
    );
  }
}
