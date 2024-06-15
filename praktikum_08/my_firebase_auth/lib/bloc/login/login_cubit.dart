import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'package:my_firebase_auth/repositories/auth_repo.dart';

import 'package:logging/logging.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final _repo = AuthRepo();
  final _logger = Logger('RegisterCubit');

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(LoginSuccess('Login berhasil!'));
    } catch (e) {
  _logger.severe('Error during login: $e');
  emit(LoginFailure(e.toString())); // Ubah RegisterFailure menjadi LoginFailure
}



    }
  }