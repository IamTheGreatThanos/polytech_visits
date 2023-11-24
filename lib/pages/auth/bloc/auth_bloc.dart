import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:polytech_visits/models/user.dart';
import 'package:polytech_visits/services/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(StateAuthInitial()) {
    on<EventAuthInitial>(_init);
    on<EventAuthLogin>(_login);
    on<EventAuthLogout>(_logout);
  }

  final repository = AuthRepository();

  _init(EventAuthInitial event, Emitter<AuthState> emit) async {
    final bool isAuth = await AuthRepository().isAuth();
    if (isAuth == true) {
      emit(StateAuthConfirmed());
    }
  }

  _login(EventAuthLogin event, Emitter<AuthState> emit) async {
    emit(StateAuthLoading());
    try {
      var response = await repository.login(event.login, event.password);
      User user = User.fromJson(response);
      await repository.setUserToCache(user);
      await repository.setUserId(user.id);
      await repository.setUserToken(response['key']);
      emit(StateAuthConfirmed());
    } catch (error) {
      emit(StateAuthRejected(error.toString()));
    }
  }

  _logout(EventAuthLogout event, Emitter<AuthState> emit) async {
    await repository.logout();
    emit(StateAuthLogout());
  }
}
