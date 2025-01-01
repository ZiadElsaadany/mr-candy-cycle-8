import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/core/utils/colors.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/banners_cubit.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/categories_cubti.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/widgets/banners_widget.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/widgets/categories_list.dart';

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

  Future.wait([
  context.read<BannersCubit>().getBanners(),
    context.read<CategoriesCubit>().getCategories()
  ]);
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
        CategoriesList()

      ],
    );
  }
}
