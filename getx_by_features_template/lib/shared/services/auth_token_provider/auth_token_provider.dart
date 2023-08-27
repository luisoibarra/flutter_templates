abstract class AuthTokenProvider {
  /// Get the complete Authorization Token.
  /// ```dart
  /// # Basic Example
  /// var token = await basicTokenProvider.authToken(); // Returns "Basic <Token>"
  /// var token = await bearerTokenProvider.authToken(); // Returns "Bearer <Token>"
  /// ```
  Future<String?> authToken();
}
