import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:portfolio/infrastructure/failures/email_failure.dart';

abstract class EmailApi {
  Future<void> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}

class EmailApiImpl implements EmailApi {
  @override
  Future<void> sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      await emailjs.send(
        'service_lkvgczg',
        'template_zjx2nfy',
        {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        },
        const emailjs.Options(publicKey: 'JUDU2bYOE2ba2BtRZ', privateKey: 'qx5vk_5-E87jjZ-E5Cuh1'),
      );
    } catch (e) {
      // Outros erros inesperados
      throw EmailFailure.serverError();
    }
  }
}
