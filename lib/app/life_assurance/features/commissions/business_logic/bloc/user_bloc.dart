// BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/app/life_assurance/features/commissions/business_logic/bloc/user_event.dart';
import 'package:learnbloc/app/life_assurance/features/commissions/business_logic/bloc/user_state.dart';

import '../../data/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository? repository;

  UserBloc(this.repository) : super(UserInitialState());

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUsersEvent) {
      yield UserLoadingState();
      try {
        final users = await repository!.fetchUsers();
        yield UserLoadedState(users);
      } catch (e) {
        yield UserErrorState('Failed to load users: $e');
      }
    }
  }
}
