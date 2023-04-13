import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/data/firebase/db/firestore_service.dart';
import '../../domain/model/installment_application.dart';
import '../../domain/repository/installment_repository.dart';
import '../model/installment_application_api_model.dart';

class InstallmentRepositoryImpl extends InstallmentRepository {
  final FireStoreService fireStoreService;

  InstallmentRepositoryImpl(this.fireStoreService);

  CollectionReference<InstallmentApplicationApiModel> get _applicationRef =>
      fireStoreService.getCollectionRef(
          'loan_application',
          (snapshot, _) =>
              InstallmentApplicationApiModel.fromMap(snapshot.data()!));

  @override
  Stream<List<InstallmentApplication>> getApplications() {
    return fireStoreService.observeList(_applicationRef).map(
          (e) => e
          .map((e) => e.toDto())
          .toList(),
    );
  }
}
