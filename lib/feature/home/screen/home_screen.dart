import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/appbar/appbar.dart';
import 'package:split/feature/home/widget/add_photo_widget.dart';
import 'package:split/feature/home/widget/home_elevated_button_custom.dart';
import 'package:split/feature/home/widget/text_from_field_custom.dart';
import 'package:split/feature/home/widget/types_itmes_list.dart';
import 'package:split/feature/widgets/custom_text.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/widgets/text_with_asterisk_widget.dart';

class HomeScreen extends BaseStatefulScreenWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState<HomeScreen> baseScreenCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool? isSelected;
  int counter = 0;
  FormFieldState<List<String>> state = FormFieldState<List<String>>();
  TextEditingController textEditingController = TextEditingController();
  List<IconData> typeListIcons = [
    AppIcons.plane,
    AppIcons.home,
    AppIcons.tower,
    AppIcons.plane
  ];

  List<String> typeListStrings = [
    LocalizationKeys.trip,
    LocalizationKeys.home,
    LocalizationKeys.tower,
    LocalizationKeys.tower,
  ];
  List<String> typeOfSplitListStrings = [
    LocalizationKeys.equal,
    LocalizationKeys.specified,
    LocalizationKeys.percentage,
  ];

  @override
  Widget baseScreenBuild(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.homeScreenBackground,
      appBar: PreferredSize(
          preferredSize: Size(0.0, 59.h),
          child: AppBarWidget(
            title: translate(LocalizationKeys.createNewGroup) ??
                "Create New group",
          )),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 25.h),
          children: [
            // IconButton(
            //     onPressed: () {
            //       _globalKey.currentState!.validate();
            //     },
            //     icon: const Icon(Icons.toc_sharp)),
            const AddPhotoWidget(),
            SizedBox(height: 15.h),
            _textWithAsterisk(translate(LocalizationKeys.groupName)!),
            SizedBox(height: 8.h),
            TextFormFieldCustom(
                hintText: translate(LocalizationKeys.enterGroupName)!,
                controller: textEditingController,
                textInputAction: TextInputAction.done,
                secureText: false,
                textInputType: TextInputType.text),
            SizedBox(height: 15.h),
            _textWithAsterisk(translate(LocalizationKeys.type)!),
            SizedBox(height: 8.h),
            TypesItemsList(
                typeListIcons, typeListStrings, const ScrollPhysics()),
            SizedBox(height: 15.h),
            _textWithAsterisk(translate(LocalizationKeys.addParticipants)!),
            _addParticipants(),
            _textWithAsterisk(translate(LocalizationKeys.typeOfSplit)!),
            TypesItemsList(null, typeOfSplitListStrings,
                const NeverScrollableScrollPhysics()),
            SizedBox(height: 15.h),
            _textWithAsterisk(translate(LocalizationKeys.currency)!),
          ],
        ),
      ),
    ));
  }

  /// //////////////////////////////////////////////////////////////////
  /// //////////////////////Helper Widgets /////////////////////////////
  /// //////////////////////////////////////////////////////////////////
  Widget _textWithAsterisk(String text) => TextWithAsterisk(
      style: textTheme.bodyMedium!
          .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      labelText: text);

  Widget _addParticipants() => InkWell(
        onTap: () {
          debugPrint("add participant Pressed");
        },
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.w, 25.h, 0, 25.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Flexible(
                  flex: 1,
                  child: Icon(
                    AppIcons.addParticipant,
                    size: 16,
                    weight: 400,
                  )),
              SizedBox(width: 10.w),
              Flexible(
                flex: 2,
                child: CustomText(
                    alignment: AlignmentDirectional.center,
                    boxFit: BoxFit.scaleDown,
                    text: translate(LocalizationKeys.addParticipants)!,
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
              )
            ],
          ),
        ),
      );
}
