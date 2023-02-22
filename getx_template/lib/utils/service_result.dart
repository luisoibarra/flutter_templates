class ServiceResult<T> {
  final T result;
  final List<String> errors;
  bool get withErrors => errors.isNotEmpty;

  ServiceResult(this.result, {this.errors = const []});
}
