import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/user_bloc.dart';
import '../../business_logic/bloc/user_state.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitialState) {
          // Initial state, you can show loading indicator or a message
          return const CircularProgressIndicator();
        } else if (state is UserLoadingState) {
          // Loading state, show loading indicator
          return const CircularProgressIndicator();
        } else if (state is UserLoadedState) {
          // Loaded state, display the list of users
          final users = state.users;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.date),
                // Add more user details here as needed
              );
            },
          );
        } else if (state is UserErrorState) {
          // Error state, show an error message
          return Text('Error: ${state.error}');
        } else {
          // Default case
          return const Text('Unknown state');
        }
      },
    );
  }
}
