import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:split/core/widgets/base_stateful_screen_widget.dart';
import 'package:split/feature/appbar/appbar_widget.dart';
import 'package:split/feature/create_group/bloc/create_group_screen_bloc.dart';
import 'package:split/feature/create_group/helper/create_group_screen_helper.dart';
import 'package:split/feature/create_group/models/group_send_ui_model.dart';
import 'package:split/feature/create_group/widget/create_group_elevated_button_custom.dart';
import 'package:split/feature/expense_details/screen/expense_details_screen.dart';
import 'package:split/feature/widgets/drop_down_form_field_widget.dart';
import 'package:split/feature/create_group/widget/image_picker_form_field_widget.dart';
import 'package:split/feature/create_group/widget/new_group_type_items_list_form_field_widget.dart';
import 'package:split/feature/create_group/widget/text_from_field_custom.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';
import 'package:split/utils/widgets/text_with_asterisk_widget.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({Key? key}) : super(key: key);
  static const routeName = "createGroupScreen";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CreateGroupScreenBloc(),
        child: const CreateGroupScreenWithBloc());
  }
}

class CreateGroupScreenWithBloc extends BaseStatefulScreenWidget {
  const CreateGroupScreenWithBloc({Key? key}) : super(key: key);

  @override
  BaseScreenState<CreateGroupScreenWithBloc> baseScreenCreateState() =>
      _CreateGroupScreenWithBloc();
}

class _CreateGroupScreenWithBloc
    extends BaseScreenState<CreateGroupScreenWithBloc> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreateGroupScreenHelper createGroupScreenHelper = CreateGroupScreenHelper();
  AutovalidateMode validationMode = AutovalidateMode.disabled;
  GroupSendUIModel groupModel = GroupSendUIModel.groupModel;

  @override
  Widget baseScreenBuild(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.createGroupScreenBackground,
      appBar: AppBarWidget(title: translate(LocalizationKeys.createNewGroup)!),
      body: BlocConsumer<CreateGroupScreenBloc, CreateGroupScreenState>(
        listener: (context, state) {
          if (state is LoadingCreateGroupScreenState) {
            showLoading();
          } else {
            hideLoading();
          }
          if (state is NotValidCreateGroupScreenState) {
            validationMode = AutovalidateMode.always;
          } else if (state
              is ValidationDoneSuccessfullyCreateGroupScreenState) {
            _createNewGroup();
          } else if (state is ErrorCaughtCreateGroupScreenState) {
            _errorCaughtCreateGroupScreenState();
          } else if (state is NewGroupCreatedSuccessfullyState) {}
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: validationMode,
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 25.h),
              children: [
                ImagePickerFormFieldWidget(
                    onSaved: _onSaveImagePicker,
                    items: PickedImageWidgetItem(value: groupModel.imageURL),
                    validator: _validateImagePicker),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.groupName)!),
                SizedBox(height: 8.h),
                TextFormFieldCustom(
                    hintText: translate(LocalizationKeys.enterGroupName)!,
                    textInputAction: TextInputAction.done,
                    secureText: false,
                    textInputType: TextInputType.text,
                    onChange: _onChangeGroupName),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.type)!),
                SizedBox(height: 8.h),
                NewGroupTypeItemsListFormFieldWidget(
                    onSaved: _onSaveTypesItemsList,
                    items: createGroupScreenHelper
                        .getCurrentTypesItemsList(appLocale),
                    validator: _typesItemsListValidator),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.addParticipants)!),
                _addParticipants(),
                _textWithAsterisk(translate(LocalizationKeys.typeOfSplit)!),
                NewGroupTypeItemsListFormFieldWidget(
                    onSaved: _onSaveTypeOfSplitItem,
                    items: createGroupScreenHelper
                        .getCurrentTypesOfSplitItemsList(appLocale),
                    validator: _newGroupTypeOfSplitItemsValidator),
                SizedBox(height: 15.h),
                _textWithAsterisk(translate(LocalizationKeys.currency)!),
                SizedBox(height: 8.h),
                DropDownFormFieldWidget(
                    onSaved: _onSaveCurrencyPicker,
                    items: createGroupScreenHelper.getCurrencyPickerItemsList(),
                    validator: _currencyPickerValidator),
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
                    onChange: _onChangeGroupDescription,
                    hintText: translate(LocalizationKeys.writeDescription)!,
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
        onTap: _addParticipantsOnTap,
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
              child: CreateGroupElevatedButtonCustom(
                  text: translate(LocalizationKeys.create)!,
                  onPressed: _onCreatePressed,
                  buttonHeight: 40.h,
                  alignment: AlignmentDirectional.center)),
          SizedBox(width: 12.w),
          Expanded(
              child: CreateGroupElevatedButtonCustom(
                  textStyle: textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  text: translate(LocalizationKeys.cancel)!,
                  onPressed: _onCancelPressed,
                  buttonColor: AppColors.createGroupScreenCancelButton,
                  buttonHeight: 40.h,
                  alignment: AlignmentDirectional.center)),
        ],
      );

  /// //////////////////////////////////////////////////////////////////
  /// //////////////////////Helper Methods /////////////////////////////
  /// //////////////////////////////////////////////////////////////////
  void _onCreatePressed() {
    currentBloc.add(ValidateFormFieldsEvent(formKey: formKey));
  }

  void _onCancelPressed() {
    debugPrint("cancel Pressed");
    Navigator.pushNamed(context, ExpenseDetailsScreen.routeName);
  }

  void _createNewGroup() {
    currentBloc.add(CreateNewGroupEvent(newGroup: groupModel));
  }

  /// image picker methods
  String? _validateImagePicker(pickedImageWidgetItem) {
    if (pickedImageWidgetItem == null) {
      return translate(LocalizationKeys.required);
    }
    return null;
  }

  void _onSaveImagePicker(pickedImageWidgetItem) {
    groupModel.imageURL = pickedImageWidgetItem!.value!;
  }

  /// new group type methods

  void _onSaveTypesItemsList(newGroupType) {
    groupModel.type = newGroupType!.value;
  }

  String? _typesItemsListValidator(newGroupType) {
    if (newGroupType == null) {
      return translate(LocalizationKeys.required);
    }
    return null;
  }

  /// new group type of split methods
  void _onSaveTypeOfSplitItem(newGroupSplitType) {
    groupModel.typeOfSplit = newGroupSplitType!.value;
  }

  String? _newGroupTypeOfSplitItemsValidator(typeOfSplitItem) {
    if (typeOfSplitItem == null) {
      return translate(LocalizationKeys.required);
    }
    return null;
  }

  /// currency picker methods
  void _onSaveCurrencyPicker(currentCurrency) {
    groupModel.currency = currentCurrency!.value;
  }

  String? _currencyPickerValidator(selectableWidgetItem) {
    if (selectableWidgetItem == null) {
      return translate(LocalizationKeys.required);
    }
    return null;
  }

  /// textFormFields methods
  void _onChangeGroupName(String? value) {
    groupModel.groupName = value ?? "";
  }

  void _onChangeGroupDescription(String? value) {
    groupModel.discription = value ?? "";
  }

  void _addParticipantsOnTap() {
    debugPrint("add participant Pressed");
  }

  void _errorCaughtCreateGroupScreenState() {}

  CreateGroupScreenBloc get currentBloc =>
      context.read<CreateGroupScreenBloc>();
}
