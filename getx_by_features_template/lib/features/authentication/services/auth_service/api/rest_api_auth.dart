import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/dto/login_result.dart';
import '../../auth_endpoint_provider/endpoints.dart';
import 'dto/login_send_info.dart';
import 'dto/register_receive_info.dart';
import 'dto/register_send_info.dart';

part 'rest_api_auth.g.dart';

@RestApi()
@LazySingleton()
abstract class RestApiAuth {
  @factoryMethod
  factory RestApiAuth(Dio dio) = _RestApiAuth;

  @POST(AuthEndpoints.login)
  Future<LoginResult> login(@Body() LoginSendInfo loginInfo);

  @POST(AuthEndpoints.register)
  Future<RegisterReceiveInfo> register(@Body() RegisterSendInfo registerInfo);
}
