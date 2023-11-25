import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
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

  final _totalFocusNode = FocusNode();
  final _timeFocusNode = FocusNode();
  final _moneyFocusNode = FocusNode();
  final _resetDayFocusNode = FocusNode();
  final _factorFocusNode = FocusNode();
  final _urlFocusNode = FocusNode();

  final fbKey = GlobalKey<FormBuilderState>();

  /// constants only in widgets
  static const Color mainInputColor = AppColor.blueLight;
  static const EdgeInsets paddingTextEditor = EdgeInsets.zero;
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
            name: "url",
            controller: _controller.urlController,
            padding: paddingTextEditor,
            prefixIcon: renderIcon(Icons.edit_calendar_outlined),
            textAlign: TextAlign.start,
            labelText: "Url",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            floatingLabelStyle: floatingLabelStyle,
            textStyle: textStyle.copyWith(fontSize: 12.scaleSize),
            maxLines: 3,
            colorBorderFocus: mainInputColor,
            type: TextInputType.text,
            action: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
            ]),
            focusNode: _urlFocusNode,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_timeFocusNode),
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
                      name: "keyValue",
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
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomInput.outline(
                    name: "numberPerDay",
                    controller: _controller.totalController,
                    padding: paddingTextEditor,
                    prefixIcon: renderIcon(Icons.drive_file_rename_outline),
                    textAlign: TextAlign.start,
                    labelText: "Số lượng/ngày",
                    labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
                    floatingLabelStyle: floatingLabelStyle,
                    textStyle: textStyle,
                    type: TextInputType.number,
                    colorBorderFocus: mainInputColor,
                    action: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
                      FormBuilderValidators.numeric(errorText: "Nhập số"),
                      FormBuilderValidators.min(1, errorText: "Nhập số > 0"),
                    ]),
                    focusNode: _totalFocusNode,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(_totalFocusNode),
                  ),
                ),
                HSpace.sm,
                Expanded(
                  child: CustomInput.outline(
                    name: "time",
                    height: 50,
                    controller: _controller.timeController,
                    padding: paddingTextEditor,
                    prefixIcon: renderIcon(Icons.access_time_outlined),
                    textAlign: TextAlign.start,
                    labelText: "Thời gian(giây)",
                    labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
                    floatingLabelStyle: floatingLabelStyle,
                    textStyle: textStyle,
                    colorBorderFocus: mainInputColor,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
                      FormBuilderValidators.numeric(errorText: "Nhập số"),
                      FormBuilderValidators.min(1, errorText: "Nhập số > 0"),
                    ]),
                    focusNode: _timeFocusNode,
                    isEmail: true,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(_timeFocusNode),
                  ),
                ),
              ],
            ),
          ),
          VSpace.lg,
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomInput.outline(
                    name: "resetDays",
                    controller: _controller.resetDaysController,
                    padding: paddingTextEditor,
                    prefixIcon: renderIcon(Icons.lock_reset),
                    textAlign: TextAlign.start,
                    labelText: "Ngày reset",
                    labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
                    floatingLabelStyle: floatingLabelStyle,
                    textStyle: textStyle,
                    colorBorderFocus: mainInputColor,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
                      FormBuilderValidators.numeric(errorText: "Nhập số"),
                      FormBuilderValidators.min(1, errorText: "Ngày > 0"),
                    ]),
                    focusNode: _resetDayFocusNode,
                    onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_resetDayFocusNode),
                  ),
                ),
                HSpace.sm,
                Expanded(
                  child: CustomInput.outline(
                    name: "factor",
                    controller: _controller.factorController,
                    padding: paddingTextEditor,
                    prefixIcon: renderIcon(Icons.numbers),
                    textAlign: TextAlign.center,
                    labelText: "Hệ số",
                    labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
                    floatingLabelStyle: floatingLabelStyle,
                    textStyle: textStyle,
                    colorBorderFocus: mainInputColor,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: S.current.Vui_long_khong_de_trong),
                      FormBuilderValidators.numeric(errorText: "Nhập số"),
                      FormBuilderValidators.min(1, errorText: "hệ số > 0"),
                    ]),
                    focusNode: _factorFocusNode,
                    onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_factorFocusNode),
                  ),
                ),
              ],
            ),
          ),
          VSpace.lg,
          CustomInput.outline(
            name: "money",
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
              FormBuilderValidators.numeric(errorText: "Nhập số"),
              FormBuilderValidators.min(1, errorText: "Số tiền > 0"),
            ]),
            focusNode: _moneyFocusNode,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_moneyFocusNode),
          ),
          VSpace.lg,
          CustomInput.selectDateTimeOutline(
            name: "finishJob",
            backgroundColor: AppColor.white,
            padding: EdgeInsets.symmetric(
              vertical: Insets.med,
              horizontal: Insets.med,
            ),
            initialDate: _state.job.finishAt,
            labelText: "Ngày kết thúc",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            prefixIcon: renderIcon(Icons.access_time_outlined),
            onChanged: (value) {
              if (value == null) return;
              _state.setJob(_state.job.copyWith(finishAt: value));
            },
          ),
          VSpace.lg,
          CustomButton.fullColor(
            width: double.infinity,
            text: "Tạo chiến dịch",
            padding: EdgeInsets.all(Insets.lg),
            background: AppColor.primaryColor,
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
