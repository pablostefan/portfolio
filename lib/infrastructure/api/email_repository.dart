import 'package:dartz/dartz.dart';
import 'package:portfolio/infrastructure/api/email_api.dart';
import 'package:portfolio/infrastructure/api/email_model.dart';
import 'package:portfolio/infrastructure/failures/email_failure.dart';

abstract class EmailRepository {
  Future<Either<EmailFailure, void>> sendEmail(Email email);
}

class EmailRepositoryImpl implements EmailRepository {
  EmailApi emailApi;

  EmailRepositoryImpl({required this.emailApi});

  @override
  Future<Either<EmailFailure, void>> sendEmail(Email email) async {
    try {
      return Right(await emailApi.sendEmail(email));
    } on EmailFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(EmailFailure.networkError());
    }
  }
}
