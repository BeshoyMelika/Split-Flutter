import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/set_account_bloc/set_account_bloc.dart';
import 'package:split/feature/auth/widgets/set_account_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';

class SetAccountScreen extends StatelessWidget {
  const SetAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetAccountBloc, SetAccountState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SubmitSetAccountSuccess) {
          return const HomeScreen();
        } else {
          return const AuthBase(body: SetAccountWidget());
        }
      },
    );
  }
}
