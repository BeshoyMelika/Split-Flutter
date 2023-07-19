import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:split/core/widgets/base_stateful_widget.dart';
import 'package:split/feature/expense_details/bloc/expense_details_screen_bloc.dart';
import 'package:split/feature/widgets/app_text_widget.dart';
import 'package:split/res/app_colors.dart';
import 'package:split/res/app_icons.dart';
import 'package:split/utils/locale/app_localization_keys.dart';

class AddPhotoReceipt extends BaseStatefulWidget {
  const AddPhotoReceipt({required this.onUploadImage, Key? key})
      : super(key: key);
  final void Function(File?) onUploadImage;

  @override
  BaseState<AddPhotoReceipt> baseCreateState() => _AddPhotoReceiptState();
}

class _AddPhotoReceiptState extends BaseState<AddPhotoReceipt> {
  File? selectedImage;
  @override
  Widget baseBuild(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _onDefaultImageTapped();
      },
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: selectedImage == null
            ? DottedBorder(
                color: AppColors.createGroupScreenAddPhotoBorder,
                strokeWidth: 2,
                radius: Radius.circular(10.r),
                borderType: BorderType.RRect,
                child: SizedBox(
                    height: 82.h,
                    width: 100.w,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(child: Icon(AppIcons.addPhoto)),
                          SizedBox(height: 5.h),
                          Flexible(
                            child: AppTextWidget(
                                text: translate(LocalizationKeys.addPhoto)!,
                                boxFit: BoxFit.scaleDown,
                                alignment: AlignmentDirectional.center,
                                style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 12)),
                          )
                        ],
                      ),
                    )))
            : SizedBox(
                height: 70.h,
                width: 71.w,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: -11,
                      top: -8,
                      child: IconButton(
                          onPressed: _deletePressed,
                          icon: SizedBox(
                            height: 15.w,
                            width: 15.w,
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Center(
                                child: Icon(
                                  AppIcons.close,
                                  color: Colors.black,
                                  size: 15.sp,
                                  weight: 900,
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  /// /////////////////////////////////////////////////////////
  /// /////////////////////Helper Methods//////////////////////
  /// /////////////////////////////////////////////////////////
  ExpenseDetailsScreenBloc get currentContext => context.read();

  Future<XFile?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      return null;
    }
  }

  Future<void> _onDefaultImageTapped() async {
    XFile? hold = await _pickImage();
    if (hold != null) {
      setState(() {
        selectedImage = File(hold.path);
      });
    }
    widget.onUploadImage(selectedImage);
  }

  void _deletePressed() {
    setState(() {
      selectedImage = null;
    });
    widget.onUploadImage(selectedImage);
  }
}
