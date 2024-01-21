import 'package:aspins_test_app/screens/home/api/users_api.dart';
import 'package:aspins_test_app/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  late UsersApi _usersApi;

  UsersCubit() : super(UsersState.initial()) {
    _usersApi = UsersApi();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    emit(state.copyWith(isLoading: true));

    final allUsersList = await _usersApi.fetchUsers();

    final topUsersList = allUsersList.getRange(0, 3).toList();
    final usersList = allUsersList.getRange(3, allUsersList.length).toList();

    emit(state.copyWith(isLoading: false, topUsersList: topUsersList, usersList: usersList));
  }
}
