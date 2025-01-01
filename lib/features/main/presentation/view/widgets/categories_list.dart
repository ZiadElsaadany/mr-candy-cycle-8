import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/core/widgets/failureWidget.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/categories_cubti.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/categories_states.dart';

import '../../../../../generated/assets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesStates>(
      builder: (context, state) {
       if(state is GetCategoriesSuccess ) {
         return Wrap(
           direction: Axis.horizontal,
           children: [
            ...state.categories.map((e)=>  Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              width: MediaQuery
                  .sizeOf(context)
                  .width * 0.29,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 45,
                        spreadRadius: 0,
                        offset: const Offset(0, 4))
                  ]),
              child: Column(
                children: [
                 CachedNetworkImage(imageUrl: e.image,height: 59,),
                  Text(e.name),
                ],
              ),
            ))


           ],
         );
       }else if(state is GetCategoriesFailure) {
         return FailureWidget(failureText: state.message);
       }else if (state is GetCategoriesLoading) {
         return    const Center(
           child: CircularProgressIndicator(),
         );
       }else  {
         return const SizedBox();
       }
      },
    );
  }
}
