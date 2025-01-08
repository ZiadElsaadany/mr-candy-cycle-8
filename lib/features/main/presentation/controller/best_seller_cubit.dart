import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/features/main/presentation/controller/best_seller_states.dart';

import '../../data/repo/main_repo.dart';

class BestSellerCubit extends Cubit<BestSellerStates> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitialState());




  final HomeRepo homeRepo;

  Future<void> getBestSeller() async {
    emit(GetBestSellerLoadingState());

    var result = await homeRepo.bestSellerProducts();
    result.fold((left) {
      emit(GetBestSellerFailureState(errorMessage: left.message));
    }, (right) {
      emit(GetBestSellerSuccessState(
        products: right
      ));
    });
  }
}
