import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (_, state) {
        if (state.signOutState.isSuccess) {
          Navigator.pop(context);
        } else if (state.signOutState.isError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 2000),
            content: Text(state.errorMessage),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
            title: const Text(
              'Main Page',
              style: TextStyle(fontSize: 20),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              context.read<MainBloc>().add(LogoutEvent());
            },
            child: state.signOutState.isLoading
                ? const CircularProgressIndicator(
              color: Colors.white,
            )
                : const Icon(Icons.logout),
          ),
        );
      },
    );
  }
}