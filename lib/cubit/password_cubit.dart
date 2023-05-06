import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surveying_engineer/cubit/password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordVisibility());

  static PasswordCubit get(context) => BlocProvider.of(context);
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;


  void isPasswordVisible() {
    passwordVisible = !passwordVisible;
    emit(PasswordVisibility());
  }

  void isConfirmPasswordVisible() {
    confirmPasswordVisible = !confirmPasswordVisible;
    emit(ConfirmPasswordVisibility());
  }
}