import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intatrack/feature/installment/data/model/paid_installment_api_model.dart';
import 'package:intatrack/feature/installment/domain/model/paid_installment.dart';
import '../../../../core/data/firebase/db/firestore_service.dart';
import '../../domain/model/installment_application.dart';
import '../../domain/repository/installment_repository.dart';
import '../model/installment_application_api_model.dart';

class InstallmentRepositoryImpl extends InstallmentRepository {
  final FireStoreService fireStoreService;

  InstallmentRepositoryImpl(this.fireStoreService);

  final String applicationCollectionRef = 'loan_application';

  CollectionReference<InstallmentApplicationApiModel> get _applicationRef =>
      fireStoreService.getCollectionRef(
          applicationCollectionRef,
          (snapshot, _) =>
              InstallmentApplicationApiModel.fromMap(snapshot.data()!));

  @override
  Stream<List<InstallmentApplication>> getApplications() {
    return fireStoreService.observeList(_applicationRef).map(
          (e) => e.map((e) => e.toDto()).toList(),
        );
  }

  @override
  Future<int> approveApplication(
      {required String id,
      required int totalCount,
      required int status}) async {
    final docRef = fireStoreService.getDocumentRef(
        '$applicationCollectionRef/$id',
        (snapshot, options) =>
            InstallmentApplicationApiModel.fromMap(snapshot.data()!));
    final obj = {
      'status': status,
      'instalment_count.total': totalCount,
    };
    await fireStoreService.updateField(obj, docRef);
    return 1;
  }

  @override
  Future<InstallmentApplication?> getApplicationById(String id) async {
    final docRef = fireStoreService.getDocumentRef(
      '$applicationCollectionRef/$id',
      (snapshot, options) =>
          InstallmentApplicationApiModel.fromMap(snapshot.data()!),
    );
    return (await fireStoreService.get(docRef))?.toDto();
  }

  @override
  Future<int> incrementPaidCount(
      {required String id, required int paidCount}) async {
    final docRef = fireStoreService.getDocumentRef(
        '$applicationCollectionRef/$id',
        (snapshot, options) =>
            InstallmentApplicationApiModel.fromMap(snapshot.data()!));
    final obj = {
      'instalment_count.paid': paidCount + 1,
    };
    await fireStoreService.updateField(obj, docRef);
    return 1;
  }

  // CollectionReference<PaidInstallmentApiModel> get _paidInstalmentRef =>
  //     fireStoreService.getCollectionRef(
  //         'instalment',
  //             (snapshot, _) =>
  //             PaidInstallmentApiModel.fromMap(snapshot.data()!));

  @override
  Stream<List<PaidInstallment>> getListOfPaidInstallments(String applicationId) {
    // TODO: implement getListOfPaidInstallments
    throw UnimplementedError();
  }
}
