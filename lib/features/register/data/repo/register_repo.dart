import 'package:dartz/dartz.dart';
import 'package:mr_candy_cycle_8/features/register/data/models/register_model.dart';

import '../../../../core/failure.dart';
import '../../../login/data/models/user_model.dart';

abstract class RegisterRepo {

  Future<Either<Failure , UserModel>>     register(
  {
    required UserModelToRegister userModelToRegister
}
) ;

}