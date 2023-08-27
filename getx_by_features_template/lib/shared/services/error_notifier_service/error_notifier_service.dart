enum ShowError {
  /// A dialog should appear with the given error
  userDialog,

  /// A bottom dialog should appear with the given error
  snackbarDialog,
}

abstract class ErrorNotifierService {
  /// Notify an error to the system.
  void notifyError(String error, {ShowError by = ShowError.userDialog});
}
