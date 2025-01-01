import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:portfolio/core/infra/email/email_service.dart';
import 'package:portfolio/shared/values/env.dart';

class EmailServiceImp implements EmailService {
  @override
  Future<void> sendEmail(Map<String, dynamic> params) async {
    var options = const emailjs.Options(publicKey: ENV.publicKey, privateKey: ENV.privateKey);
    await emailjs.send(ENV.service, ENV.template, params, options);
  }
}
