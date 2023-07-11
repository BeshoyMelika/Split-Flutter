import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/appbar/appbar.dart';
import 'package:split/feature/home/bloc/home_screen_bloc.dart';
import 'package:split/feature/home/widget/currency_picker_widget.dart';
import 'package:split/feature/home/widget/image_picker_widget.dart';
import 'package:split/feature/home/widget/types_items_lists.dart';
import 'package:split/feature/home/widget/home_elevated_button_custom.dart';
import 'package:split/feature/home/widget/text_from_field_custom.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/models/group_model.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/widgets/text_with_asterisk_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: const HomeScreenWithBloc());
  }
}

class HomeScreenWithBloc extends BaseStatefulScreenWidget {
  const HomeScreenWithBloc({Key? key}) : super(key: key);

  @override
  BaseScreenState<HomeScreenWithBloc> baseScreenCreateState() =>
      _HomeScreenWithBlocState();
}

class _HomeScreenWithBlocState extends BaseScreenState<HomeScreenWithBloc> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool? isSelected;
  int counter = 0;
  FormFieldState<List<String>> state = FormFieldState<List<String>>();
  TextEditingController groupName = TextEditingController();
  TextEditingController description = TextEditingController();
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
  final List<String> currencyListItems = [
    LocalizationKeys.dollar,
    LocalizationKeys.pound,
  ];
  bool autoValidate = false;
  String? image;
  GroupModel groupModel = GroupModel(
      image: "image",
      groupName: "groupName",
      type: "type",
      currency: "currency",
      discription: "discription",
      typeOfSplit: "typeOfSplit");
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
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (previous, current) {
          if (current is UnValidHomeScreenState) {
            autoValidate = true;
            return true;
          } else if (current is ValidationDoneSuccessfullyHomeScreenState) {
            _onValidationDoneSuccessfully();
          } else if (current is WaitingHomeScreenState) {
          } else if (current is ErrorCaughtHomeScreenState) {
          } else if (current is NewGroupCreatedSuccessfullyState) {
            _newGroupCreatedSuccessfully();
          }
          return false;
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            key: _globalKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 25.h),
              children: [
                ImagePickerWidget(
                    onSaved: (pickedImageWidgetItem) {
                      groupModel.image = pickedImageWidgetItem!.value!;
                    },
                    items: PickedImageWidgetItem(value: image),
                    validator: (pickedImageWidgetItem) {
                      if (pickedImageWidgetItem == null) {
                        return translate(LocalizationKeys.required);
                      }
                      return null;
                    }),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.groupName)!),
                SizedBox(height: 8.h),
                TextFormFieldCustom(
                    hintText: translate(LocalizationKeys.enterGroupName)!,
                    controller: groupName,
                    textInputAction: TextInputAction.done,
                    secureText: false,
                    textInputType: TextInputType.text),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.type)!),
                SizedBox(height: 8.h),
                TypesItemsList(
                    onSaved: (selectableWidget) {
                      groupModel.type = selectableWidget!.value;
                    },
                    items: typeListStrings
                        .map((e) => SelectableWidgetItem(
                            value: translate(e)!,
                            key: e,
                            icon: typeListIcons[typeListStrings.indexOf(e)]))
                        .toList(),
                    validator: (selectableWidgetItem) {
                      if (selectableWidgetItem == null) {
                        return translate(LocalizationKeys.required);
                      }
                      return null;
                    }),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.addParticipants)!),
                _addParticipants(),
                _textWithAsterisk(translate(LocalizationKeys.typeOfSplit)!),
                TypesItemsList(
                    onSaved: (selectableWidget) {
                      groupModel.typeOfSplit = selectableWidget!.value;
                    },
                    items: typeOfSplitListStrings
                        .map((e) => SelectableWidgetItem(
                            value: translate(e)!, key: e, icon: null))
                        .toList(),
                    validator: (selectableWidgetItem) {
                      if (selectableWidgetItem == null) {
                        return translate(LocalizationKeys.required);
                      }
                      return null;
                    }),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.currency)!),
                SizedBox(height: 8.h),
                CurrencyPickerWidget(
                    onSaved: (currentCurrency) {
                      groupModel.currency = currentCurrency!.value;
                    },
                    items: currencyListItems
                        .map((e) => CurrencyPickerWidgetItem(value: e, key: e))
                        .toList(),
                    validator: (selectableWidgetItem) {
                      if (selectableWidgetItem == null) {
                        return translate(LocalizationKeys.required);
                      }
                      return null;
                    }),
                //CurrencyPicker(onChanged: (value) {}),
                SizedBox(height: 15.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AppTextWidget(
                      text: translate(LocalizationKeys.description)!,
                      boxFit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.center,
                      style: textTheme.bodyMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 8.h),
                TextFormFieldCustom(
                    hintText: translate(LocalizationKeys.writeDescription)!,
                    controller: description,
                    textInputAction: TextInputAction.done,
                    secureText: false,
                    maxLines: 6,
                    textInputType: TextInputType.text),
                SizedBox(height: 25.h),
                _createAndCancelButtons(),
              ],
            ),
          );
        },
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
                child: AppTextWidget(
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

  Widget _createAndCancelButtons() => Row(
        children: [
          Expanded(
              child: HomeElevatedButtonCustom(
                  text: translate(LocalizationKeys.create)!,
                  onPressed: () {
                    _onCreatePressed();
                  },
                  buttonHeight: 40.h,
                  alignment: AlignmentDirectional.center)),
          SizedBox(width: 12.w),
          Expanded(
              child: HomeElevatedButtonCustom(
                  textStyle: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  text: translate(LocalizationKeys.cancel)!,
                  onPressed: () {},
                  buttonColor: AppColors.homeScreenCancelButton,
                  buttonHeight: 40.h,
                  alignment: AlignmentDirectional.center)),
        ],
      );

  /// //////////////////////////////////////////////////////////////////
  /// //////////////////////Helper Methods /////////////////////////////
  /// //////////////////////////////////////////////////////////////////
  void _onCreatePressed() {
    BlocProvider.of<HomeScreenBloc>(context)
        .add(ValidateFormFieldsEvent(globalKey: _globalKey));
  }

  void _onValidationDoneSuccessfully() {
    groupModel.groupName = groupName.text;
    groupModel.discription = description.text;
    BlocProvider.of<HomeScreenBloc>(context)
        .add(CreateNewGroupEvent(newGroup: groupModel));
    showLoading();
  }

  void _newGroupCreatedSuccessfully() {
    hideLoading();
  }
}
