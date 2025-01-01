import 'package:portfolio/core/error/base_failure.dart';
import 'package:portfolio/core/infra/email/email_service.dart';
import 'package:portfolio/data/datasources/email_datasource.dart';
import 'package:portfolio/domain/entities/email_entity.dart';

class EmailRemoteDatasourceImp extends EmailDataSource {
  final EmailService _emailService;

  EmailRemoteDatasourceImp(this._emailService);

  @override
  Future<void> sendEmail(EmailEntity email) async {
    try {
      await _emailService.sendEmail(email.toJson());
    } catch (e, s) {
      throw EmailFailure(stackTrace: s);
    }
  }
}
