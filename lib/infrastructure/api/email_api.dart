import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:portfolio/infrastructure/api/email_model.dart';
import 'package:portfolio/infrastructure/failures/email_failure.dart';
import 'package:portfolio/values/env.dart';

abstract class EmailApi {
  Future<void> sendEmail(Email email);
}

class EmailApiImpl implements EmailApi {
  @override
  Future<void> sendEmail(Email email) async {
    try {
      await emailjs.send(
        ENV.service,
        ENV.template,
        email.toJson(),
        const emailjs.Options(publicKey: ENV.publicKey, privateKey: ENV.privateKey),
      );
    } catch (e) {
      throw EmailFailure.serverError();
    }
  }
}
