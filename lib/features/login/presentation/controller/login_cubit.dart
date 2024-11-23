import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mr_candy_cycle_8/features/login/data/repo/login_repo.dart';
import 'package:mr_candy_cycle_8/features/login/presentation/controller/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  final LoginRepo loginRepo ;

  Future<void> login(
  {
    required String email ,
    required String pass ,
}
      )  async{

    emit(LoginLoadingState());
    var result = await loginRepo.login(email: email, pass: pass);

    result.fold((left )  {
      emit(LoginFailureState(errorMessage: left.message));
    } , (right) async{
      var box = Hive.box("setting");
      await box.put("token", right.token);
      emit(LoginSuccessState(userModel: right));
    });




  }

}
