import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_receive_info.freezed.dart';
part 'register_receive_info.g.dart';

@Freezed()
class RegisterReceiveInfo with _$RegisterReceiveInfo {
  const factory RegisterReceiveInfo({
    required bool adminApprovalRequired,
    required bool confirmationSent,
    required int pwnedResult,
  }) = _RegisterReceiveInfo;

  factory RegisterReceiveInfo.fromJson(Map<String, Object?> json) =>
      _$RegisterReceiveInfoFromJson(json);
}
