import 'package:mr_candy_cycle_8/features/login/data/models/user_model.dart';

abstract class RegisterStates{ }
class RegisterInitialState extends RegisterStates{ }
class PickedImageState extends RegisterStates{ }
class RegisterLoadingState extends RegisterStates{ }
class RegisterSuccessState extends RegisterStates{
  final UserModel userModel;

  RegisterSuccessState({required this.userModel});

}
class RegisterFailureState extends RegisterStates{
  final String errorMessage ;

  RegisterFailureState({required this.errorMessage});

}