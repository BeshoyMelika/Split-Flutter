import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:split/feature/auth/auth_bloc/success_message_bloc/success_message_bloc.dart';
import 'package:split/feature/auth/widgets/app_elevated_button.dart';
import 'package:split/res/app_asset_paths.dart';
import 'package:split/res/app_colors.dart';

bool previous = true;

class SuccessMessageWidget extends StatelessWidget {
  const SuccessMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundOfWidget,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 70, bottom: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppAssetPaths.checkMarkSuccess),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Congrats',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: AppColors.titleOfWidget,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              previous
                  ? 'Reset password successfully'
                  : 'You have successfully Registered',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.descriptionOfWidget,
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            Row(
              children: [
                Expanded(
                    child: AppButton(
                  title: 'Done',
                  onPressed: () {
                    BlocProvider.of<SuccessMessageBloc>(context)
                        .add(DoneEvent());
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
