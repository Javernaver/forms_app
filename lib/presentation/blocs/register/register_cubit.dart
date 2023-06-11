import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'register_state.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    logger.i('onSubmit Cubit: $state');
    emit(state.copyWith(formStatus: FormStatus.posting));
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }
}
