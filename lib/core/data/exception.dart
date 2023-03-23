class FirebaseException implements Exception {
  final String message;

  FirebaseException._({required this.message});

  factory FirebaseException.authException({required String msg}) = FirebaseAuthException;

  @override
  String toString() {
    return message;
  }
}

class FirebaseAuthException extends FirebaseException {
  FirebaseAuthException({required String msg}) : super._(message: msg);
}