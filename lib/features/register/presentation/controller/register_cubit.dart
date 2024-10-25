import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_candy_cycle_8/features/register/presentation/controller/register_states.dart';

import '../../data/models/register_model.dart';
import '../../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepo) : super(RegisterInitialState());

  final RegisterRepo registerRepo ;

  Future<void> register(
  {
   required UserModelToRegister userModelToRegister
}
      )  async{

    emit(RegisterLoadingState());
    var result = await registerRepo.register(
      userModelToRegister: userModelToRegister

    );

    result.fold((left )  {
      emit(RegisterFailureState(errorMessage: left.message));
    } , (right) async{
      var box = Hive.box("setting");
   await    box.put("token", right.token);

      emit(RegisterSuccessState(userModel: right));
    });




  }

  XFile? image;
  String? base64;
  final ImagePicker picker = ImagePicker();
  Future<void> pickProfileImage( ) async{
    image  = await picker.pickImage(source: ImageSource.camera);
    if(image!=null ){
      File imageFile =  File(image!.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      base64 = base64Encode(imageBytes);
      log("base64 ${base64}");
    }

    emit(PickedImageState( ));
  }
}
