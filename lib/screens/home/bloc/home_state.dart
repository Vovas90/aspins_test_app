import 'package:aspins_test_app/screens/home/model/user.dart';

class UsersState {
  final List<User> topUsersList;
  final List<User> usersList;
  final bool isLoading;
  final String error;

  UsersState({
    required this.topUsersList,
    required this.usersList,
    required this.isLoading,
    required this.error,
  });

  factory UsersState.initial() => UsersState(
        isLoading: false,
        topUsersList: [],
        usersList: const [],
        error: '',
      );

  UsersState copyWith({
    List<User>? topUsersList,
    List<User>? usersList,
    bool? isLoading,
    String? error,
  }) =>
      UsersState(
        topUsersList: topUsersList ?? this.topUsersList,
        usersList: usersList ?? this.usersList,
        isLoading: isLoading ?? false,
        error: error ?? '',
      );
}
