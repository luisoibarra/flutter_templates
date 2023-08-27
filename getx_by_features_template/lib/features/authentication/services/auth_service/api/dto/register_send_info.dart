import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_send_info.freezed.dart';
part 'register_send_info.g.dart';

@Freezed()
class RegisterSendInfo with _$RegisterSendInfo {
  const factory RegisterSendInfo({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required DateTime dateOfBirth,
    required String phoneNumber,
  }) = _RegisterSendInfo;

  factory RegisterSendInfo.fromJson(Map<String, Object?> json) =>
      _$RegisterSendInfoFromJson(json);
}
