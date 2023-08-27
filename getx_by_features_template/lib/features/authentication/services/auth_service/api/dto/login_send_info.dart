import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_send_info.freezed.dart';
part 'login_send_info.g.dart';

@Freezed()
class LoginSendInfo with _$LoginSendInfo {
  const factory LoginSendInfo({
    required String password,
    required String email,
  }) = _LoginSendInfo;

  factory LoginSendInfo.fromJson(Map<String, Object?> json) =>
      _$LoginSendInfoFromJson(json);
}
