import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_cycle_8/core/apis/endpoints.dart';
import 'package:mr_candy_cycle_8/core/failure.dart';
import 'package:mr_candy_cycle_8/features/login/data/models/user_model.dart';
import 'package:mr_candy_cycle_8/features/login/data/repo/login_repo.dart';
import 'package:http/http.dart' as http;
import 'package:mr_candy_cycle_8/features/register/data/repo/register_repo.dart';

import '../models/register_model.dart';

class RegisterRepoImplementation implements RegisterRepo {
  @override
  Future<Either<Failure, UserModel>> register(
      {required UserModelToRegister userModelToRegister}) async {
    try {
      var result = await http.post(
          Uri.parse(Endpoints.baseUrl + Endpoints.register),
          body: userModelToRegister.toJson());
      var body = jsonDecode(result.body);
      if (body["status"]) {
        return right(UserModel(
            id: body["data"]["id"],
            name: body["data"]["name"],
            email: body["data"]["email"],
            phone: body["data"]["phone"],
            image: body["data"]["image"],
            points:0,
            credit:0,
            token: body["data"]["token"]));
      } else {
        return left(ApiFailure(message: body["message"]));
      }
    } on SocketException {
      return left(NoInternetFailure(message: "No Internet"));
    } catch (e) {
      return left(ApiFailure(message: "Error Occurred"));
    }
  }
}
