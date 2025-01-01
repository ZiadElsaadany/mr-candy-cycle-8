import 'package:mr_candy_cycle_8/features/main/data/models/banner_model.dart';
import 'package:mr_candy_cycle_8/features/main/data/models/category_model.dart';

abstract class CategoriesStates{ }
class CategoriesInitial extends CategoriesStates{ }
class GetCategoriesLoading extends CategoriesStates{ }
class GetCategoriesSuccess extends CategoriesStates{
  final List<CategoryModel>   categories ;

  GetCategoriesSuccess({required this.categories});
}
class GetCategoriesFailure extends CategoriesStates{
  final String message;
  GetCategoriesFailure( {
    required this.message
  });
}