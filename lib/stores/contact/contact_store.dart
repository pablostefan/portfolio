import 'package:flutter_triple/flutter_triple.dart';
import 'package:portfolio/view_models/contact/contact_view_model.dart';

class ContactStore extends Store<ContactViewModel> {
  ContactStore() : super(ContactViewModel());

  @override
  void initStore() {
    super.initStore();
    state.emailController.addListener(_onEmailChanged);
    state.messageController.addListener(_onMessageChanged);
    state.nameController.addListener(_onNameChanged);
  }

  void _onNameChanged() => update(state.copyWith(name: state.nameController.text));

  void _onEmailChanged() => update(state.copyWith(email: state.emailController.text));

  void _onMessageChanged() => update(state.copyWith(message: state.messageController.text));

  void onSubmitMessage() {
    print('Sending email');
  }
}
