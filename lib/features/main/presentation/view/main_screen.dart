import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_candy_cycle_8/core/utils/colors.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/banners_cubit.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/best_seller_cubit.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/categories_cubti.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/widgets/banners_widget.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/widgets/best_seller_list.dart';
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
    context.read<CategoriesCubit>().getCategories(),
    context.read<BestSellerCubit>().getBestSeller(),
  ]);
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BannersWidget(),
         Text(
          "الاقسام",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
              fontSize: 15.sp),
        ),
        CategoriesList(),
         Text(
          "الأكثر مبيعا",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.mainColor,
              fontSize: 15.sp),
        ),
        SizedBox(
            height: 220.h,
            child: BestSellerList())

      ],
    );
  }
}
