import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/best_seller_cubit.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/best_seller_states.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/view/main_screen.dart';

import '../../../../../core/widgets/failureWidget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import 'best_seller_widget.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerStates>(
      builder: (context, state) {
        if (state is GetBestSellerLoadingState) {
          return const LoadingWidget();
        } else if (state is GetBestSellerSuccessState) {
          return ListView.separated(
              itemCount: state.products.length,
              separatorBuilder: (c, index) {
                return 16.horizontalSpace;
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, index) {
                return BestSellerWidget(productModel: state.products[index],);
              });
        } else if (state is GetBestSellerFailureState) {
          return FailureWidget(
            failureText: state.errorMessage,
            onPressed: () {
              BlocProvider.of<BestSellerCubit>(context).getBestSeller();
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
