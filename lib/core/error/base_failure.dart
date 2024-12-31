abstract class BaseFailure {
  final String message;
  final StackTrace? stackTrace;

  const BaseFailure({required this.message, this.stackTrace});

  @override
  String toString() {
    return 'Failure: $message${stackTrace != null ? '\nStackTrace: $stackTrace' : ''}';
  }
}

class EmailFailure extends BaseFailure {
  const EmailFailure({super.stackTrace, super.message = 'Send email error'});
}

class ExceptionFailure extends BaseFailure {
  ExceptionFailure({super.stackTrace}) : super(message: 'An unknown error occurred');
}
