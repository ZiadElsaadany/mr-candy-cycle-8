import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_cycle_8/core/apis/endpoints.dart';
import 'package:mr_candy_cycle_8/core/failure.dart';
import 'package:mr_candy_cycle_8/features/login/data/models/user_model.dart';
import 'package:mr_candy_cycle_8/features/login/data/repo/login_repo.dart';
import 'package:http/http.dart'as http;
class LoginRepoImplementation implements LoginRepo {
  @override
  Future<Either<Failure, UserModel>> login({required String email, required String pass})async{
  try  {
    var result  =await http.post(
        Uri.parse(Endpoints.baseUrl+Endpoints.login),
        body: {
          "email": email,
          "password": pass
        }
    );
    var body =    jsonDecode( result.body);
    if(body["status"]){
      return  right(UserModel(id: body["data"]["id"], name: body["data"]["name"], email: body["data"]["email"], phone: body["data"]["phone"], image: body["data"]["image"], points: body["data"]["points"], credit: body["data"]["credit"], token: body["data"]["token"]));
    }else{
      return left(ApiFailure(message: body["message"]));
    }

  }on SocketException{
    return left(NoInternetFailure(message: "No Internet"));
  }
  catch(e) {
    return left(ApiFailure(message: "Error Occurred"));
  }




  }

}