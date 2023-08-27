import '../../../../shared/services/endpoint_provider/endpoints.dart';

abstract class AuthEndpoints {
  static const baseUrl = SharedEndpoints.defaultBaseUrl;

  static const login = "$baseUrl/auth/login";
  static const singUp = "$baseUrl/sing-up";
  static const register = "$baseUrl/auth/register";
}
