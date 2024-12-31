import 'package:either_dart/either.dart';
import 'package:portfolio/core/error/base_failure.dart';
import 'package:portfolio/core/utils/base_repository.dart';
import 'package:portfolio/data/datasources/email_datasource.dart';
import 'package:portfolio/domain/entities/email_entity.dart';
import 'package:portfolio/domain/repositories/movies_repository.dart';

class EmailRepositoryImp extends BaseRepository implements EmailRepository {
  final EmailDataSource _emailDataSource;

  EmailRepositoryImp(this._emailDataSource);

  @override
  Future<Either<BaseFailure, void>> sendEmail(EmailEntity email) {
    return tryExecute<void>(() async => await _emailDataSource.sendEmail(email));
  }
}
