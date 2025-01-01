import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy_cycle_8/core/failure.dart';
import 'package:mr_candy_cycle_8/features/login/data/models/user_model.dart';
import 'package:mr_candy_cycle_8/features/main/data/models/banner_model.dart';
import 'package:mr_candy_cycle_8/features/main/data/models/category_model.dart';
import 'package:mr_candy_cycle_8/features/main/data/repo/main_repo.dart';
import 'package:http/http.dart' as http;

import '../../../../core/apis/endpoints.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  Future<Either<Failure, List<BannerModel>>> getBanners() async {
    try {
      var result = await http.get(
        Uri.parse(Endpoints.baseUrl + Endpoints.banners),
      );
      var body = jsonDecode(result.body);
      if (body["status"]) {
        var r = List<BannerModel>.from((body["data"] as List)
            .map((e) => BannerModel(id: e["id"], image: e["image"])));
        return right(r);
      } else {
        return left(ApiFailure(message: body["message"]));
      }
    } on SocketException {
      return left(NoInternetFailure(message: "No Internet"));
    } catch (e) {
      return left(ApiFailure(message: "Error Occurred"));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      var result = await http.get(
        Uri.parse(Endpoints.baseUrl + Endpoints.categories),
      );
      var body = jsonDecode(result.body);
      if (body["status"]) {
        var r = List<CategoryModel>.from((body["data"]["data"] as List)
            .map((e) => CategoryModel(id: e["id"], image: e["image"], name: e["name"])));
        return right(r);
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
