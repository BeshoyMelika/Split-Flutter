import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split/feature/auth/auth_base.dart';
import 'package:split/feature/auth/auth_bloc/success_message_bloc/success_message_bloc.dart';
import 'package:split/feature/auth/screens/set_account_screen.dart';
import 'package:split/feature/auth/widgets/success_message_widget.dart';
import 'package:split/feature/home/screen/home_screen.dart';

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({super.key});
  static const routeName = 'successMessageScreen';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuccessMessageBloc, SuccessMessageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DoneSuccessState) {
          if (previous == true) {
            return const HomeScreen();
          } else {
            return const SetAccountScreen();
          }
        } else {
          return const AuthBase(body: SuccessMessageWidget());
        }
      },
    );
  }
}
