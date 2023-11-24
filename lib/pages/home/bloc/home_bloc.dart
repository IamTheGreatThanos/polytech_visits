import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:polytech_visits/models/user.dart';
import 'package:polytech_visits/services/auth_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(_init);
  }

  final repository = AuthRepository();

  _init(HomeEvent event, Emitter<HomeState> emit) async {
    final User? user = await repository.getUserFromCache();

    if (user != null) {
      emit(HomeLoadedState(user));
    }
  }
}
