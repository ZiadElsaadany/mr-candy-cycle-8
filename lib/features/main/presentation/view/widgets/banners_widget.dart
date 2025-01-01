import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/core/failure.dart';
import 'package:mr_candy_cycle_8/core/widgets/failureWidget.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/banners_cubit.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/banners_states.dart';
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
    return BlocBuilder<BannersCubit, BannersStates>(
      builder: (context, state) {
         if(state is GetBannersSuccess) {
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
                             ...state.banners.map((e) =>
                                 CachedNetworkImage(
                                   imageUrl: e.image,
                                   errorWidget: (c, e, u) {
                                     return const Icon(Icons.error);
                                   },
                                   placeholder: (c, e) {
                                     return const Center(
                                         child: CircularProgressIndicator());
                                   },
                                 ))
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
                               setState(() {});
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
                   count: state.banners.length,
                   effect: const ExpandingDotsEffect(
                       dotWidth: 6,
                       dotHeight: 6,
                       activeDotColor: AppColors.mainColor),
                   // your preferred effect
                   onDotClicked: (index) {},
                   controller: PageController(initialPage: pageIndex),
                 ),
               )
             ],
           );
         } else if(state is GetBannersLoading){
           return const Center(child: CircularProgressIndicator());
           } else if(state is GetBannersFailure ){
             return FailureWidget(failureText: state.message,onPressed: (){
               context.read<BannersCubit>().getBanners();

             },);
           }else{
           return const SizedBox();
         }
         },
    );
  }
}
