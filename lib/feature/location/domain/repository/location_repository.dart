import '../../../../core/data/repository.dart';
import '../mdoel/geo_location.dart';

abstract class LocationRepository extends Repository {
  Future<GeoLocation?> getUserLocation({required String userId});
}