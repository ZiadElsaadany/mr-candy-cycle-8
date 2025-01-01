import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';

abstract class HomeRepo{

 Future<Either<Failure,List<BannerModel>>> getBanners();
 Future<Either<Failure,List<CategoryModel>>> getCategories();
}