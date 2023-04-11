import '../../../../core/data/firebase/db/firestore_doc.dart';
import 'contact_api_model.dart';

class ContactsResponse extends FireStoreDoc {
  final List<ContactApiModel> contacts;

  ContactsResponse({required this.contacts});

  factory ContactsResponse.fromMap(Map<String, dynamic> map) {
    final List<ContactApiModel> contactsList = List<ContactApiModel>.from(
      (map['contacts'] as List<dynamic>).map(
            (dynamic contact) => ContactApiModel.fromMap(contact),
      ),
    );
    return ContactsResponse(contacts: contactsList);
  }

  @override
  Map<String, List<ContactApiModel>> toMap() => <String, List<ContactApiModel>>{
    'contacts': contacts,
  };
}
