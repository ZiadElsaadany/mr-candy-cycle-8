import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_candy_cycle_8/core/utils/colors.dart';

import '../../../../generated/assets.dart';


class HomeBottomScreen extends StatefulWidget {
  const HomeBottomScreen({super.key});

  @override
  State<HomeBottomScreen> createState() => _HomeBottomScreenState();
}

class _HomeBottomScreenState extends State<HomeBottomScreen> {

  int currentIndex= 0  ;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
      bottomNavigationBar: SizedBox(

        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.75),
            elevation: 0,
            backgroundColor:  AppColors.mainColor,
            currentIndex: currentIndex,
            onTap: (index){
              currentIndex = index;
              setState((){ }) ;

            },

            showUnselectedLabels: true,

              items:[
            BottomNavigationBarItem(icon: SvgPicture.asset(

             currentIndex ==0 ?    Assets.imagesHomeActive:Assets.imagesHomeNotActive
            ), label: "الرئيسية",


            ),
            BottomNavigationBarItem(icon: SvgPicture.asset(Assets.imagesFav), label: "المفضلة"  ,

            ),
            BottomNavigationBarItem(icon: SvgPicture.asset(

                currentIndex ==2 ?Assets.imagesActiveCart:
                Assets.imagesCart), label: "السلة",

            ),
            BottomNavigationBarItem(icon: SvgPicture.asset(Assets.imagesSettings), label: "الاعدادات",

            ),
          ]),
        ),
      ),
      ),
    );
  }
}
