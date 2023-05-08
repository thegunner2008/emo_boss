import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:emo_boss/common/styles/styles.dart';
//
// @Deprecated(
//   "Use CustomInput instead, It will delete in the future",
// )
// Widget CustomInput.outline({
//   Key? key,
//   String? name,
//   String? initialValue,
//   TextEditingController? controller,
//   VoidCallback? onTap,
//   Function(String?)? onSaved,
//   Function(String?)? onChanged,
//   VoidCallback? onEditingComplete,
//   List<TextInputFormatter>? inputFormatters,
//   FormFieldValidator<String>? validator,
//   void Function(String?)? onFieldSubmitted,
//   double? width,
//   double? height,
//   TextInputType? type,
//   TextInputAction? action,
//   Widget? prefixIcon,
//   Widget? suffixIcon,
//   bool? enabled,
//   bool isShow = false,
//   bool isRequired = false,
//   bool isEmail = false,
//   bool readOnly = false,
//   FocusNode? focusNode,
//   TextAlign textAlign = TextAlign.start,
//   double widthBorder = Strokes.thin,
//   double borderRadius = Corners.med,
//   double widthBorderFocus = Strokes.thin,
//   EdgeInsetsGeometry? padding,
//   String hintText = "",
//   String labelText = "",
//   double? fontSize,
//   Color? textColor,
//   Color? backgroundColor,
//   Color colorBorder = AppColor.grey300,
//   Color colorBorderFocus = AppColor.blueLight,
//   Color colorHintText = AppColor.grey600,
//   Color? cursorColor,
//   Color? hoverColor,
//   TextStyle? textStyle,
//   TextStyle? hintTextStyle,
//   TextStyle? labelStyle,
//   TextStyle? floatingLabelStyle,
//   List<BoxShadow>? boxShadow,
//   bool? isDense,
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
//   int? maxLines = 1,
//   int? minLines = 1,
//   void Function(bool)? onFocusChange,
//   ValueTransformer<String?>? valueTransformer,
// }) {
//   return Container(
//     padding: EdgeInsets.zero,
//     margin: EdgeInsets.zero,
//     height: height,
//     width: width,
//     decoration: BoxDecoration(
//       boxShadow: boxShadow,
//     ),
//     child: Focus(
//       onFocusChange: onFocusChange,
//       child: FormBuilderTextField(
//         key: key,
//         autovalidateMode: autovalidateMode,
//         valueTransformer: valueTransformer,
//         textAlign: textAlign,
//         onChanged: onChanged,
//         initialValue: initialValue,
//         onTap: onTap,
//         inputFormatters: inputFormatters,
//         onEditingComplete: onEditingComplete,
//         onSubmitted: onFieldSubmitted,
//         readOnly: readOnly,
//         onSaved: onSaved,
//         maxLines: maxLines,
//         minLines: minLines,
//         enabled: enabled ?? true,
//         controller: controller,
//         focusNode: focusNode,
//         textInputAction: action,
//         validator: validator,
//         keyboardType: type,
//         style: textStyle ??
//             TextStyles.input1.copyWith(
//               color: textColor,
//               fontSize: fontSize,
//             ),
//         textAlignVertical: TextAlignVertical.center,
//         obscureText: isShow,
//         cursorColor: cursorColor,
//         scrollPadding: const EdgeInsets.symmetric(horizontal: 5),
//         decoration: outlineInputDecoration(
//           borderRadius: borderRadius,
//           backgroundColor: backgroundColor,
//           colorBorder: colorBorder,
//           colorBorderFocus: colorBorderFocus,
//           colorHintText: colorHintText,
//           floatingLabelStyle: floatingLabelStyle,
//           hintText: getRequiredLabel(hintText, isRequired: isRequired),
//           hintTextStyle: hintTextStyle,
//           hoverColor: hoverColor,
//           labelStyle: labelStyle,
//           labelText: getRequiredLabel(labelText, isRequired: isRequired),
//           padding: padding,
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           widthBorder: widthBorder,
//           widthBorderFocus: widthBorderFocus,
//           isDense: isDense,
//         ),
//         name: name ?? '',
//       ),
//     ),
//   );
// }
//
// @Deprecated(
//   "Use CustomInput instead, It will delete in the future",
// )
// Widget inputDropdownOutline<T>({
//   Key? key,
//   required List<DropdownMenuItem<T>> items,
//   String name = '',
//   T? initialValue,
//   VoidCallback? onTap,
//   FormFieldValidator<T>? validator,
//   ValueChanged<T?>? onChanged,
//   double? width,
//   double? height,
//   Widget? prefixIcon,
//   Widget? suffixIcon,
//   bool enabled = true,
//   bool isShow = false,
//   FocusNode? focusNode,
//   double widthBorder = Strokes.thin,
//   double borderRadius = Corners.med,
//   double widthBorderFocus = Strokes.thin,
//   EdgeInsetsGeometry? padding,
//   String hintText = "",
//   String labelText = "",
//   bool isRequired = false,
//   double? fontSize,
//   Color? textColor,
//   Color? backgroundColor,
//   Color colorBorder = AppColor.grey300,
//   Color colorBorderFocus = AppColor.blueLight,
//   Color colorHintText = AppColor.grey600,
//   Color? cursorColor,
//   Color? hoverColor,
//   TextStyle? textStyle,
//   TextStyle? hintTextStyle,
//   TextStyle? labelStyle,
//   TextStyle? floatingLabelStyle,
//   List<BoxShadow>? boxShadow,
// }) {
//   return Container(
//     key: key,
//     padding: EdgeInsets.zero,
//     margin: EdgeInsets.zero,
//     height: height,
//     width: width,
//     decoration: BoxDecoration(
//       boxShadow: boxShadow,
//     ),
//     child: FormBuilderDropdown<T>(
//       initialValue: initialValue,
//       items: items,
//       onChanged: onChanged,
//       onTap: onTap,
//       enabled: enabled,
//       focusNode: focusNode,
//       style: textStyle ??
//           TextStyles.input1.copyWith(
//             color: textColor,
//             fontSize: fontSize,
//           ),
//       validator: validator,
//       decoration: outlineInputDecoration(
//           borderRadius: borderRadius,
//           backgroundColor: backgroundColor,
//           colorBorder: colorBorder,
//           colorBorderFocus: colorBorderFocus,
//           colorHintText: colorHintText,
//           floatingLabelStyle: floatingLabelStyle,
//           hintText: getRequiredLabel(hintText, isRequired: isRequired),
//           hintTextStyle: hintTextStyle,
//           hoverColor: hoverColor,
//           labelStyle: labelStyle,
//           labelText: getRequiredLabel(labelText, isRequired: isRequired),
//           padding: padding,
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           widthBorder: widthBorder,
//           widthBorderFocus: widthBorderFocus),
//       name: name,
//     ),
//   );
// }

@Deprecated(
  "Use CustomInput instead, It will delete in the future",
)
Widget dayInputOutLine({
  Key? key,
  String name = "",
  DateTime? initialDate,
  TextEditingController? controller,
  VoidCallback? onEditingComplete,
  String? Function(DateTime?)? validator,
  double? width,
  double? height,
  TextInputAction? action,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool? enabled,
  bool isShow = false,
  FocusNode? focusNode,
  TextAlign textAlign = TextAlign.start,
  double widthBorder = Strokes.thin,
  double borderRadius = Corners.med,
  double widthBorderFocus = Strokes.thin,
  EdgeInsetsGeometry? padding,
  ValueChanged<DateTime?>? onChanged,
  String hintText = "",
  String labelText = "",
  bool isRequired = false,
  double? fontSize,
  Color? textColor,
  Color? backgroundColor,
  Color colorBorder = AppColor.grey300,
  Color colorBorderFocus = AppColor.blueLight,
  Color colorHintText = AppColor.grey600,
  Color? cursorColor,
  Color? hoverColor,
  TextStyle? textStyle,
  TextStyle? hintTextStyle,
  TextStyle? labelStyle,
  TextStyle? floatingLabelStyle,
  List<BoxShadow>? boxShadow,
  DateTime? firstDate,
  DateTime? lastDate,
}) {
  return Container(
    key: key,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    height: height,
    width: width,
    decoration: BoxDecoration(
      boxShadow: boxShadow,
    ),
    child: FormBuilderDateTimePicker(
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: initialDate,
      textAlign: textAlign,
      onEditingComplete: onEditingComplete,
      maxLines: 1,
      minLines: 1,
      initialValue: initialDate,
      format: DateFormat('dd/MM/yyyy'),
      onChanged: onChanged,
      inputType: InputType.date,
      enabled: enabled ?? true,
      controller: controller,
      focusNode: focusNode,
      textInputAction: action,
      validator: validator,
      style: textStyle ??
          TextStyles.input1.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
      obscureText: isShow,
      cursorColor: cursorColor,
      scrollPadding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: outlineInputDecoration(
          borderRadius: borderRadius,
          backgroundColor: backgroundColor,
          colorBorder: colorBorder,
          colorBorderFocus: colorBorderFocus,
          colorHintText: colorHintText,
          floatingLabelStyle: floatingLabelStyle,
          hintText: getRequiredLabel(hintText, isRequired: isRequired),
          hintTextStyle: hintTextStyle,
          hoverColor: hoverColor,
          labelStyle: labelStyle,
          labelText: getRequiredLabel(labelText, isRequired: isRequired),
          padding: padding,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ?? const Icon(Icons.calendar_month),
          widthBorder: widthBorder,
          widthBorderFocus: widthBorderFocus),
      name: name,
    ),
  );
}

// @Deprecated(
//   "Use CustomInput instead, It will delete in the future",
// )
// Widget typeAheadOutline({
//   Key? key,
//   double? height,
//   double? width,
//   List<BoxShadow>? boxShadow,
//   required void Function(dynamic) onSuggestionSelected,
//   required Widget Function(BuildContext, dynamic) itemBuilder,
//   required FutureOr<Iterable<dynamic>> Function(String) suggestionsCallback,
//   TextEditingController? controller,
//   Color? backgroundColor,
//   Function(dynamic)? onChanged,
//   Color colorBorder = AppColor.grey300,
//   Color colorBorderFocus = AppColor.blueLight,
//   Color colorHintText = AppColor.grey600,
//   Color? cursorColor,
//   Color? hoverColor,
//   TextStyle? textStyle,
//   TextStyle? hintTextStyle,
//   TextStyle? labelStyle,
//   TextStyle? floatingLabelStyle,
//   TextInputAction? action,
//   Widget? prefixIcon,
//   Widget? suffixIcon,
//   TextAlign textAlign = TextAlign.start,
//   double widthBorder = Strokes.thin,
//   double borderRadius = Corners.med,
//   double widthBorderFocus = Strokes.thin,
//   EdgeInsetsGeometry padding = EdgeInsets.zero,
//   String hintText = "",
//   String labelText = "",
//   bool isRequired = false,
//   double? fontSize,
//   Color? textColor,
//   void Function(bool)? onFocusChange,
// }) {
//   return Container(
//       key: key,
//       padding: EdgeInsets.zero,
//       margin: EdgeInsets.zero,
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         boxShadow: boxShadow,
//       ),
//       child: Focus(
//           onFocusChange: onFocusChange,
//           child: TypeAheadField(
//             onSuggestionSelected: onSuggestionSelected,
//             itemBuilder: itemBuilder,
//             suggestionsCallback: suggestionsCallback,
//             hideOnEmpty: true,
//             errorBuilder: (BuildContext context, Object? error) => Text(
//                 '$error',
//                 style: TextStyle(color: Theme.of(context).errorColor)),
//             textFieldConfiguration: TextFieldConfiguration(
//               controller: controller,
//               onChanged: onChanged,
//               decoration: outlineInputDecoration(
//                 borderRadius: borderRadius,
//                 backgroundColor: backgroundColor,
//                 colorBorder: colorBorder,
//                 colorBorderFocus: colorBorderFocus,
//                 colorHintText: colorHintText,
//                 floatingLabelStyle: floatingLabelStyle,
//                 hintText: getRequiredLabel(hintText, isRequired: isRequired),
//                 hintTextStyle: hintTextStyle,
//                 hoverColor: hoverColor,
//                 labelStyle: labelStyle,
//                 labelText: getRequiredLabel(labelText, isRequired: isRequired),
//                 padding: padding,
//                 prefixIcon: prefixIcon,
//                 suffixIcon: suffixIcon,
//                 widthBorder: widthBorder,
//                 widthBorderFocus: widthBorderFocus,
//               ),
//             ),
//           )));
// }

@Deprecated(
  "Use CustomInput instead, It will delete in the future",
)
InputDecoration outlineInputDecoration({
  String? labelText,
  TextStyle? labelStyle,
  String? hintText,
  TextStyle? hintTextStyle,
  TextStyle? floatingLabelStyle,
  Color? backgroundColor,
  Color? hoverColor,
  Widget? prefixIcon,
  Widget? suffixIcon,
  EdgeInsetsGeometry? padding,
  Color colorBorder = AppColor.grey300,
  Color colorBorderFocus = AppColor.blueLight,
  Color colorError = AppColor.errorColor,
  Color colorHintText = AppColor.grey600,
  double widthBorder = Strokes.thin,
  double borderRadius = Corners.med,
  double widthBorderFocus = Strokes.thin,
  bool? isDense,
}) =>
    InputDecoration(
      isDense: isDense,
      labelText: labelText,
      labelStyle: labelStyle,
      floatingLabelStyle: floatingLabelStyle,
      fillColor: backgroundColor,
      hoverColor: hoverColor,
      filled: true,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: padding,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: colorBorderFocus, width: widthBorderFocus),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorBorder, width: widthBorder),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorBorder, width: widthBorder),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorError, width: widthBorder),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorError, width: widthBorder),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      hintStyle:
          hintTextStyle ?? TextStyles.input1.copyWith(color: colorHintText),
    );

String getRequiredLabel(String fieldName, {bool isRequired = false}) {
  return "$fieldName${isRequired ? "*" : ""}";
}
