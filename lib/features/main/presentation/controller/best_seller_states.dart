
import 'package:mr_candy_cycle_8/features/main/data/models/product_model.dart';

abstract class BestSellerStates{ }
class BestSellerInitialState extends BestSellerStates {}
class GetBestSellerLoadingState extends BestSellerStates {}
class GetBestSellerFailureState extends BestSellerStates {
  final String errorMessage;

  GetBestSellerFailureState({required this.errorMessage});
}
class GetBestSellerSuccessState extends BestSellerStates {
  final List<ProductModel> products;

  GetBestSellerSuccessState({required this.products});
}