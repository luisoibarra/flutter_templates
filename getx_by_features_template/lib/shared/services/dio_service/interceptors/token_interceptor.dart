import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../auth_token_provider/auth_token_provider.dart';

@Injectable()
class TokenInterceptor extends Interceptor {
  final AuthTokenProvider _tokenProvider;

  TokenInterceptor(this._tokenProvider);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.headers.containsKey("Authorization")) {
      final token = await _tokenProvider.authToken();
      if (token != null) {
        options.headers["Authorization"] = token;
      }
    }

    super.onRequest(options, handler);
  }
}
