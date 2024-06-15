import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_firebase_auth/repositories/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final _repo = AuthRepo();

  Future<void> register({required String email, required String password}) async {
  emit(RegisterLoading());
  try {
    await _repo.register(email: email, password: password);
    emit(RegisterSuccess('Berhasil!'));
  } catch (e) {
    if (e is String) {
      emit(RegisterFailure(e)); // Menangkap kesalahan tipe String
    } else {
      emit(RegisterFailure('Gagal mendaftar. Terjadi kesalahan.'));
    }
  }
}
}