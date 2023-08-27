import 'package:freezed_annotation/freezed_annotation.dart';

import '../user.dart';

part 'login_result.freezed.dart';
part 'login_result.g.dart';

@Freezed()
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String token,
    required User user,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, Object?> json) =>
      _$LoginResultFromJson(json);
}
