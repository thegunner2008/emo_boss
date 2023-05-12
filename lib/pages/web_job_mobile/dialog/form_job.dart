import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../index.dart';

class FormJob extends StatefulWidget {
  const FormJob({Key? key}) : super(key: key);

  @override
  State<FormJob> createState() => _FormJobState();
}

class _FormJobState extends State<FormJob> {
  WebJobMobileController get _controller => WebJobMobileController.to;

  GetJobState get _state => _controller.state;

  final totalFocusNode = FocusNode();
  final timeFocusNode = FocusNode();
  final moneyFocusNode = FocusNode();

  final fbKey = GlobalKey<FormBuilderState>();

  /// constants only in widgets
  static const Color mainInputColor = AppColor.blueLight;
  static final EdgeInsets paddingTextEditor = EdgeInsets.fromLTRB(
    Insets.lg / 2,
    Insets.lg,
    Insets.lg / 2,
    Insets.lg,
  );
  static final TextStyle floatingLabelStyle = TextStyles.title1.copyWith(
    color: mainInputColor,
    height: 1,
  );

  Widget renderIcon(IconData icon, {double? size}) {
    return Icon(
      icon,
      color: AppColor.black800,
      size: size ?? IconSizes.med,
    );
  }

  final textStyle = TextStyles.title1.copyWith(
    color: AppColor.black800,
  );

  final iconView = Icon(
    Icons.equalizer,
    color: AppColor.black800,
    size: IconSizes.med,
  );

  final iconResfresh = Icon(
    Icons.refresh,
    color: AppColor.primaryColor,
    size: IconSizes.lg,
  );

  final padding = EdgeInsets.only(
    left: Insets.lg,
    right: Insets.xs,
    top: Insets.sm,
    bottom: Insets.sm,
  );

  final floatingStyle = TextStyles.title1.copyWith(
    color: AppColor.secondaryColor,
    height: 1,
  );

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: fbKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          CustomInput.outline(
            padding: padding,
            prefixIcon: iconView,
            textAlign: TextAlign.start,
            labelText: "Từ khoá",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingStyle,
            textStyle: textStyle,
            colorBorderFocus: AppColor.secondaryColor,
            enabled: false,
            hintText: _state.job.keyWord,
          ),
          VSpace.lg,
          CustomInput.outline(
            maxLines: 2,
            padding: padding,
            prefixIcon: iconView,
            textAlign: TextAlign.start,
            labelText: "Domain",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingStyle,
            textStyle: textStyle,
            colorBorderFocus: AppColor.secondaryColor,
            enabled: false,
            hintText: _state.job.baseUrl,
          ),
          VSpace.lg,
          CustomInput.outline(
            maxLines: 2,
            padding: padding,
            prefixIcon: iconView,
            textAlign: TextAlign.start,
            labelText: "Url",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingStyle,
            textStyle: textStyle,
            colorBorderFocus: AppColor.secondaryColor,
            enabled: false,
            hintText: _state.job.url,
          ),
          VSpace.lg,
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Expanded(
                    child: CustomInput.outline(
                      maxLines: 2,
                      padding: padding,
                      prefixIcon: iconView,
                      textAlign: TextAlign.start,
                      labelText: "key-value",
                      labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
                      floatingLabelStyle: floatingStyle,
                      textStyle: textStyle,
                      colorBorderFocus: AppColor.secondaryColor,
                      enabled: false,
                      hintText: "${_state.indexPage} - ${_state.valuePage}",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => _controller.handleValuePage(),
                  icon: iconResfresh,
                ),
              ],
            ),
          ),
          VSpace.lg,
          CustomInput.outline(
            controller: _controller.totalController,
            padding: paddingTextEditor,
            prefixIcon: renderIcon(Icons.drive_file_rename_outline),
            textAlign: TextAlign.start,
            labelText: "Tổng số lượng",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingLabelStyle,
            textStyle: textStyle,
            type: TextInputType.number,
            colorBorderFocus: mainInputColor,
            action: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
              FormBuilderValidators.numeric(errorText: "Vui lòng nhập số"),
              FormBuilderValidators.min(1, errorText: "Vui lòng nhập số lượng 0"),
            ]),
            focusNode: totalFocusNode,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(totalFocusNode),
          ),
          VSpace.lg,
          CustomInput.outline(
            controller: _controller.timeController,
            padding: paddingTextEditor,
            prefixIcon: renderIcon(Icons.access_time_outlined),
            textAlign: TextAlign.start,
            labelText: "Thời gian (giây)",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingLabelStyle,
            textStyle: textStyle,
            colorBorderFocus: mainInputColor,
            type: TextInputType.number,
            action: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
              FormBuilderValidators.numeric(errorText: "Vui lòng nhập số"),
              FormBuilderValidators.min(1, errorText: "Vui lòng nhập số lớn hơn 0"),
            ]),
            focusNode: timeFocusNode,
            isEmail: true,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(timeFocusNode),
          ),
          VSpace.lg,
          CustomInput.outline(
            controller: _controller.moneyController,
            padding: paddingTextEditor,
            prefixIcon: renderIcon(Icons.attach_money_sharp),
            textAlign: TextAlign.start,
            labelText: "Số tiền",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingLabelStyle,
            textStyle: textStyle,
            colorBorderFocus: mainInputColor,
            type: TextInputType.number,
            action: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
              FormBuilderValidators.numeric(errorText: "Vui lòng nhập số"),
              FormBuilderValidators.min(1, errorText: "Vui lòng tiền lớn hơn 0"),
            ]),
            focusNode: moneyFocusNode,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(moneyFocusNode),
          ),
          VSpace.lg,
          CustomButton.fullColor(
            width: double.infinity,
            text: "Tạo chiến dịch",
            padding: EdgeInsets.all(Insets.lg),
            background: AppColor.successColor,
            boxShadow: Shadows.universal,
            onPressed: () {
              if (!fbKey.currentState!.saveAndValidate()) {
                return;
              }
              _controller.handleFinishJob(context);
            },
          ),
        ],
      ),
    );
  }
}
