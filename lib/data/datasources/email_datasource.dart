import 'package:portfolio/domain/entities/email_entity.dart';

abstract class EmailDataSource {
  Future<void> sendEmail(EmailEntity email);
}
