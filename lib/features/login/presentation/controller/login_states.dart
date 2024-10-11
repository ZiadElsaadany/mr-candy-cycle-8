import 'package:mr_candy_cycle_8/features/login/data/models/user_model.dart';

abstract class LoginStates{ }
class LoginInitialState extends LoginStates{ }
class LoginLoadingState extends LoginStates{ }
class LoginSuccessState extends LoginStates{
  final UserModel userModel;

  LoginSuccessState({required this.userModel});

}
class LoginFailureState extends LoginStates{
  final String errorMessage ;

  LoginFailureState({required this.errorMessage});

}