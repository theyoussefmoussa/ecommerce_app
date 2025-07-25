class AuthResult {
  final bool success;
  final String? errorMessage;

  AuthResult({required this.success, this.errorMessage});

  factory AuthResult.success() => AuthResult(success: true);

  factory AuthResult.failure(String message) =>
      AuthResult(success: false, errorMessage: message);
}
