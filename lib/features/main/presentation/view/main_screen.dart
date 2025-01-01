import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/core/utils/colors.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/banners_cubit.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/widgets/banners_widget.dart';

import '../../../../generated/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
@override
  void initState() {
    super.initState();
    context.read<BannersCubit>().getBanners();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BannersWidget(),
        const Text(
          "الاقسام",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
              fontSize: 15),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 45,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesDrinks,
                    width: 67,
                    height: 59,
                  ),
                  Text("مشروبات"),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 45,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesDrinks,
                    width: 67,
                    height: 59,
                  ),
                  Text("مشروبات"),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 45,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    Assets.imagesDrinks,
                    width: 67,
                    height: 59,
                  ),
                  Text("مشروبات"),
                ],
              ),
            ),

          ],
        )
      ],
    );
  }
}
