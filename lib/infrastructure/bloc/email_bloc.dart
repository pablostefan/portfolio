import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/infrastructure/api/email_repository.dart';

part 'email_bloc.freezed.dart';
part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailBloc(this._emailRepository) : super(const EmailState.initial()) {
    // Configurando o handler para o evento SendEmail
    on<SendEmail>(_onSendEmail);
  }

  // Handler para o evento SendEmail
  Future<void> _onSendEmail(
    SendEmail event,
    Emitter<EmailState> emit,
  ) async {
    emit(const EmailState.sendingEmail());

    final result = await _emailRepository.sendEmail(
      name: event.name,
      email: event.email,
      subject: event.subject,
      message: event.message,
    );

    result.fold(
      (failure) {
        emit(const EmailState.failure());
      },
      (success) {
        emit(const EmailState.emailSentSuccessFully());
      },
    );
  }
}
