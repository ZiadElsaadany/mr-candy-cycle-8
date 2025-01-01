import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy_cycle_8/features/main/data/repo/main_repo.dart';

import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit({required this.homeRepo}) : super(CategoriesInitial());

  final HomeRepo homeRepo;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());

    var result = await homeRepo.getCategories();
    result.fold((left) {
      emit(GetCategoriesFailure(message: left.message));
    }, (right) {
      emit(GetCategoriesSuccess(categories: right));
    });
  }
}
