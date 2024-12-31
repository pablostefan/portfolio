import 'package:get_it/get_it.dart';
import 'package:portfolio/core/infra/emails/email_service.dart';
import 'package:portfolio/core/infra/emails/email_service_imp.dart';
import 'package:portfolio/data/datasources/email_datasource.dart';
import 'package:portfolio/data/datasources/remote/email_remote_datasource_imp.dart';
import 'package:portfolio/data/repositories/email_repository_imp.dart';
import 'package:portfolio/domain/repositories/movies_repository.dart';
import 'package:portfolio/presentation/contact/controller/contact_controller.dart';

class Injection {
  static void init() {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<EmailService>(() => EmailServiceImp());
    getIt.registerLazySingleton<EmailDataSource>(() => EmailRemoteDatasourceImp(getIt()));
    getIt.registerLazySingleton<EmailRepository>(() => EmailRepositoryImp(getIt()));
    getIt.registerLazySingleton<ContactController>(() => ContactController(getIt()));
  }
}
