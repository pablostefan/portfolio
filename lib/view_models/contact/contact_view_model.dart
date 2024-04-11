import 'package:flutter/cupertino.dart';

class ContactViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String name = '';
  String email = '';
  String message = '';

  ContactViewModel copyWith({String? name, String? email, String? message}) {
    return ContactViewModel()
      ..name = name ?? this.name
      ..email = email ?? this.email
      ..message = message ?? this.message
      ..nameController = nameController
      ..emailController = emailController
      ..messageController = messageController;
  }
}
