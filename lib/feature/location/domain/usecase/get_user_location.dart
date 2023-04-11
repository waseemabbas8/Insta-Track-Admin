import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../mdoel/geo_location.dart';
import '../repository/location_repository.dart';

class GetUserLocationParams {
  final String userId;

  GetUserLocationParams(this.userId);
}
abstract class GetUserLocationUseCase extends UseCase<GeoLocation, GetUserLocationParams> {}

class GetUserLocationUseCaseImpl extends GetUserLocationUseCase {
  final LocationRepository locationRepository;

  GetUserLocationUseCaseImpl({required this.locationRepository});

  @override
  Future<Result<GeoLocation>> call({required GetUserLocationParams params}) async {
    try {
      final location = await locationRepository.getUserLocation(userId: params.userId);
      if(location == null) {
        return Result.error(FirebaseException.noDataException(msg: 'no location found'));
      }
      return Result.success(location);
    } catch (e) {
      return Result.error(FirebaseException.noDataException(msg: e.toString()));
    }
  }
}