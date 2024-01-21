import 'package:aspins_test_app/constants/colors.dart';
import 'package:aspins_test_app/constants/strings.dart';
import 'package:aspins_test_app/screens/home/bloc/home_cubit.dart';
import 'package:aspins_test_app/screens/home/bloc/home_state.dart';
import 'package:aspins_test_app/screens/home/widgets/top_user_item.dart';
import 'package:aspins_test_app/screens/home/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final firstTopUser = state.topUsersList[0];
          final secondTopUser = state.topUsersList[1];
          final thirdTopUser = state.topUsersList[2];

          final usersList = state.usersList;

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AspinsColors.mainColor,
                centerTitle: true,
                title: const Text(Strings.leaders),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TabBar(
                      tabs: const [
                        Tab(text: Strings.thisWeek),
                        Tab(text: Strings.allTime),
                      ],
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AspinsColors.mainColor,
                      ),
                      unselectedLabelColor: AspinsColors.black,
                      labelColor: AspinsColors.white,
                      labelPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TopUserItem(
                            ratingNumber: '2',
                            name: secondTopUser.name,
                            cost: '${secondTopUser.price}\$',
                            avatarSrc: secondTopUser.avatar,
                          ),
                        ),
                        TopUserItem(
                          ratingNumber: '1',
                          name: firstTopUser.name,
                          cost: '${firstTopUser.price}\$',
                          avatarSrc: firstTopUser.avatar,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TopUserItem(
                            ratingNumber: '3',
                            name: thirdTopUser.name,
                            cost: '${thirdTopUser.price}\$',
                            avatarSrc: thirdTopUser.avatar,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        return UserItem(
                          ratingNumber: '${index + 4}',
                          name: usersList[index].name,
                          cost: '${usersList[index].price}\$',
                          avatarSrc: usersList[index].avatar,
                          isPro: usersList[index].isPro,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
