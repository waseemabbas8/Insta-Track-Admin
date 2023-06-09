class FirebaseException implements Exception {
  final String message;

  FirebaseException._({required this.message});

  factory FirebaseException.authException({required String msg}) = FirebaseAuthException;
  factory FirebaseException.noDataException({required String msg}) = FirebaseDataNotFoundException;
  factory FirebaseException.badRequest({required String msg}) = FirebaseBadRequestException;

  @override
  String toString() {
    return message;
  }
}

class FirebaseAuthException extends FirebaseException {
  FirebaseAuthException({required String msg}) : super._(message: msg);
}

class FirebaseDataNotFoundException extends FirebaseException {
  FirebaseDataNotFoundException({required String msg}) : super._(message: msg);
}

class FirebaseBadRequestException extends FirebaseException {
  FirebaseBadRequestException({required String msg}) : super._(message: msg);
}