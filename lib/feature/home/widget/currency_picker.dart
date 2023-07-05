// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:split/core/widgets/base_stateful_widget.dart';
// import 'package:split/feature/widgets/custom_text.dart';
// import 'package:split/res/app_colors.dart';
// import 'package:split/utils/locale/app_localization_keys.dart';
//
// class CurrencyPicker extends BaseStatefulWidget {
//   const CurrencyPicker({required this.onChanged, Key? key}) : super(key: key);
//   final void Function(bool?) onChanged;
//
//   @override
//   BaseState<CurrencyPicker> baseCreateState() => _CurrencyPickerState();
// }
//
// class _CurrencyPickerState extends BaseState<CurrencyPicker> {
//   final List<String> items = [
//     LocalizationKeys.dollar,
//     LocalizationKeys.pound,
//   ];
//   List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
//     List<DropdownMenuItem<String>> menuItems = [];
//     for (var item in items) {
//       menuItems.add(
//         DropdownMenuItem<String>(
//           value: item,
//           child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//               child: CustomText(
//                   alignment: AlignmentDirectional.center,
//                   boxFit: BoxFit.scaleDown,
//                   text: translate(item)!,
//                   style: textTheme.bodyMedium!
//                       .copyWith(fontWeight: FontWeight.w500, fontSize: 18))),
//         ),
//       );
//     }
//     return menuItems;
//   }
//
//   String? selectedValue;
//
//   final FocusNode focusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     focusNode.addListener(() => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     focusNode.dispose();
//   }
//
//   @override
//   Widget baseBuild(BuildContext context) {
//     return SizedBox(
//       width: 298.w,
//       height: 60.h,
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           focusNode: focusNode,
//           isExpanded: true,
//           style: const TextStyle(
//               color: AppColors.textFormFieldHintText,
//               fontSize: 18,
//               fontWeight: FontWeight.w400),
//           hint: CustomText(
//               alignment: AlignmentDirectional.center,
//               boxFit: BoxFit.scaleDown,
//               text: translate(LocalizationKeys.dollar)!,
//               style: const TextStyle(
//                   color: AppColors.textFormFieldHintText,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400)),
//           items: _addDividersAfterItems(items),
//           value: selectedValue,
//           onChanged: (value) {
//             setState(() {
//               value == items[0]
//                   ? widget.onChanged(false)
//                   : widget.onChanged(true);
//
//               selectedValue = value as String;
//             });
//           },
//           buttonStyleData: ButtonStyleData(
//             padding: const EdgeInsets.only(left: 14, right: 14),
//             decoration: BoxDecoration(
//               color: AppColors.textFormFieldFill,
//               borderRadius: BorderRadius.circular(50.r),
//               border: Border.all(color: AppColors.textFormFieldFill),
//             ),
//           ),
//           iconStyleData: const IconStyleData(
//               icon: Icon(
//                 Icons.keyboard_arrow_down,
//               ),
//               iconSize: 16,
//               iconEnabledColor: AppColors.textFormFieldFill),
//           dropdownStyleData: DropdownStyleData(
//             maxHeight: 200.h,
//             width: 280.w,
//             padding: null,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
