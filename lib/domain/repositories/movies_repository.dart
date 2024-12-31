import 'package:either_dart/either.dart';
import 'package:portfolio/core/error/base_failure.dart';
import 'package:portfolio/domain/entities/email_entity.dart';

abstract class EmailRepository {
  Future<Either<BaseFailure, void>> sendEmail(EmailEntity email);
}
