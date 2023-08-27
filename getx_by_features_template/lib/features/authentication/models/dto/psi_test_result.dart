import 'package:freezed_annotation/freezed_annotation.dart';

part 'psi_test_result.freezed.dart';
part 'psi_test_result.g.dart';

@Freezed()
class PsiTestResult with _$PsiTestResult {
  const factory PsiTestResult({
    required String name,
    required String registrationNumber,
    required DateTime dateRegistered,
    required DateTime expiryCertificateDate,
    required String county,
    required int countryId,
    required bool isAttachedToRegistration,
  }) = _PsiTestResult;

  factory PsiTestResult.fromJson(Map<String, Object?> json) =>
      _$PsiTestResultFromJson(json);
}
