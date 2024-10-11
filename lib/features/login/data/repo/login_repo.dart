import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../models/user_model.dart';

abstract class LoginRepo {

 Future<Either<Failure , UserModel>>     login({required String  email , required String pass} ) ;

}