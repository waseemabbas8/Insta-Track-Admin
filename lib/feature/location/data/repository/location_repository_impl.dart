import '../../../../core/data/firebase/db/firestore_service.dart';
import '../../domain/mdoel/geo_location.dart';
import '../../domain/repository/location_repository.dart';
import '../model/location_api_model.dart';

class LocationRepositoryImpl extends LocationRepository {
  final FireStoreService fireStoreService;

  LocationRepositoryImpl({required this.fireStoreService});

  @override
  Future<GeoLocation?> getUserLocation({required String userId}) async {
    final locationRef = fireStoreService.getDocumentRef(
      'locations/$userId',
      (snapshot, options) => LocationApiModel.fromMap(snapshot.data()!),
    );
    final locationApiModel = await fireStoreService.get(locationRef);
    return locationApiModel?.toDto();
  }
}
