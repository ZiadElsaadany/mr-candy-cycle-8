import 'package:mr_candy_cycle_8/features/main/data/models/banner_model.dart';

abstract class BannersStates{ }
class BannersInitial extends BannersStates{ }
class GetBannersLoading extends BannersStates{ }
class GetBannersSuccess extends BannersStates{
  final List<BannerModel>   banners ;

  GetBannersSuccess({required this.banners});
}
class GetBannersFailure extends BannersStates{
  final String message;
  GetBannersFailure( {
    required this.message
});
}