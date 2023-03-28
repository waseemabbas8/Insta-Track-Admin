class FirebaseException implements Exception {
  final String message;

  FirebaseException._({required this.message});

  factory FirebaseException.authException({required String msg}) = FirebaseAuthException;
  factory FirebaseException.noDataException({required String msg}) = FirebaseDataNotFoundException;

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