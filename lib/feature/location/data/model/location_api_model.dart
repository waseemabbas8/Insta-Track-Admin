import '../../../../core/data/firebase/db/firestore_doc.dart';
import '../../domain/mdoel/geo_location.dart';

class LocationApiModel extends FireStoreDoc {
  final double latitude;
  final double longitude;

  LocationApiModel({required this.latitude, required this.longitude});

  factory LocationApiModel.fromMap(Map<String, dynamic> map) => LocationApiModel(
        latitude: map['latitude'] as double,
        longitude: map['longitude'] as double,
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
    'latitude': latitude,
    'longitude': longitude,
  };

  GeoLocation toDto() => GeoLocation(
    latitude: latitude,
    longitude: longitude,
  );
}
