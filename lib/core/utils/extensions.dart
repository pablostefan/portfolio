import 'package:email_validator/email_validator.dart';

extension Validator on String {
  bool get isValidEmail => EmailValidator.validate(this);
}
