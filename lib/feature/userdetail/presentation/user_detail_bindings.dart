import 'package:get/get.dart';

import '../../location/data/repository/location_repository_impl.dart';
import '../../location/domain/repository/location_repository.dart';
import '../../location/domain/usecase/get_user_location.dart';
import '../../user/domain/usecase/get_contacts.dart';
import 'user_detail_controller.dart';

class UserDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationRepository>(() => LocationRepositoryImpl(fireStoreService: Get.find()));
    Get.lazyPut<GetUserLocationUseCase>(
      () => GetUserLocationUseCaseImpl(locationRepository: Get.find()),
    );
    Get.lazyPut<GetContactsUseCase>(() => GetContactsUseCaseImpl(userRepository: Get.find()));
    Get.lazyPut(
      () => UserDetailController(
        userObj: Get.arguments[0],
        activateUser: Get.find(),
        getUserLocation: Get.find(),
        getContacts: Get.find(),
      ),
    );
  }
}
