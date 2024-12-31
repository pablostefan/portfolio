import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/domain/entities/email_entity.dart';
import 'package:portfolio/domain/repositories/movies_repository.dart';
import 'package:portfolio/shared/values/values.dart';

class ContactController extends ChangeNotifier {
  final EmailRepository _repository;

  ContactController(this._repository);

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool isTextValid(String value) => value.isNotEmpty;

  bool isSendingEmail = false;
  bool nameFilled = false;
  bool emailFilled = false;
  bool subjectFilled = false;
  bool messageFilled = false;
  bool nameHasError = false;
  bool emailHasError = false;
  bool subjectHasError = false;
  bool messageHasError = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void isNameValid(String name) {
    bool isValid = isTextValid(name);
    nameFilled = isValid;
    nameHasError = !isValid;
    notifyListeners();
  }

  void isEmailValid(String email) {
    bool isValid = email.isValidEmail();
    emailFilled = isValid;
    emailHasError = !isValid;
    notifyListeners();
  }

  void isSubjectValid(String subject) {
    bool isValid = isTextValid(subject);
    subjectFilled = isValid;
    subjectHasError = !isValid;
    notifyListeners();
  }

  void isMessageValid(String message) {
    bool isValid = isTextValid(message);
    messageFilled = isValid;
    messageHasError = !isValid;
    notifyListeners();
  }

  void clearText() {
    nameController.text = "";
    emailController.text = "";
    subjectController.text = "";
    messageController.text = "";
    notifyListeners();
  }

  void sendEmail(BuildContext context) {
    if (_isFormValid) {
      _sendEmailRequest(context);
    } else {
      isNameValid(nameController.text);
      isEmailValid(emailController.text);
      isSubjectValid(subjectController.text);
      isMessageValid(messageController.text);
    }
  }

  void _sendEmailRequest(BuildContext context) async {
    isLoading.value = true;
    var result = await _repository.sendEmail(_email);
    result.fold((_) => _handleError(context), (_) => _handleSuccess(context));
    isLoading.value = false;
  }

  void _handleSuccess(BuildContext context) {
    Functions.showSnackBar(
      context: context,
      message: StringConst.EMAIL_RESPONSE,
    );
  }

  void _handleError(BuildContext context) {
    Functions.showSnackBar(
      context: context,
      message: StringConst.EMAIL_FAILED_RESPONSE,
      backgroundColor: AppColors.errorRed100,
    );
  }

  EmailEntity get _email => EmailEntity(
        name: nameController.text,
        email: emailController.text,
        subject: subjectController.text,
        message: messageController.text,
      );

  bool get _isFormValid => nameFilled && subjectFilled && messageFilled && emailFilled;
}
