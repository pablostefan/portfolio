import 'package:dartz/dartz.dart';
import 'package:portfolio/infrastructure/api/email_api.dart';
import 'package:portfolio/infrastructure/api/email_model.dart';
import 'package:portfolio/infrastructure/failures/email_failure.dart';

abstract class EmailRepository {
  Future<Either<EmailFailure, Email>> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailRepositoryImpl implements EmailRepository {
  EmailApi emailApi;

  EmailRepositoryImpl({
    required this.emailApi,
  });

  @override
  Future<Either<EmailFailure, Email>> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final emailStatus = await emailApi.sendEmail(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );
      print(emailStatus);
      return Right(emailStatus);
    } catch (e) {
      print(e.toString());
      if (e == EmailFailure.serverError()) {
        return Left(EmailFailure.serverError());
      } else {
        return Left(EmailFailure.networkError());
      }
    }
  }
}
