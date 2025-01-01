import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/features/main/data/models/banner_model.dart';
import 'package:mr_candy_cycle_8/features/main/data/repo/main_repo.dart';

import 'banners_states.dart';

class BannersCubit extends Cubit<BannersStates> {
  BannersCubit({required this.homeRepo}) : super(BannersInitial());
  final HomeRepo homeRepo;

  Future<void> getBanners() async {
    debugPrint("start get banners");
    emit(GetBannersLoading());
    var result = await homeRepo.getBanners();
    result.fold((left) {
      debugPrint("left list<Banners>: ${left.message}");

      emit(GetBannersFailure(message: left.message));
    }, (right) {
      debugPrint("right list<Banners>: ${right.length}");
      emit(GetBannersSuccess(
        banners: right
      ));
    });
  }
}
