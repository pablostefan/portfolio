import 'package:dartz/dartz.dart';
import 'package:portfolio/infrastructure/api/email_api.dart';
import 'package:portfolio/infrastructure/failures/email_failure.dart';

abstract class EmailRepository {
  Future<Either<EmailFailure, void>> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailRepositoryImpl implements EmailRepository {
  EmailApi emailApi;

  EmailRepositoryImpl({required this.emailApi});

  @override
  Future<Either<EmailFailure, void>> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      return Right(await emailApi.sendEmail(name: name, email: email, subject: subject, message: message));
    } catch (e) {
      if (e == EmailFailure.serverError()) {
        return Left(EmailFailure.serverError());
      } else {
        return Left(EmailFailure.networkError());
      }
    }
  }
}
