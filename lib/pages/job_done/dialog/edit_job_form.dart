import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/styles/styles.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/utils/utils.dart';
import 'package:emo_boss/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditJobForm extends StatefulWidget {
  const EditJobForm({Key? key, required this.job, required this.hideDeleteButton})
      : super(key: key);
  final Job job;
  final bool hideDeleteButton;

  @override
  State<EditJobForm> createState() => _FormJobState();
}

class _FormJobState extends State<EditJobForm> {
  Job get _currentJob => widget.job;

  JobDoneController get _controller => JobDoneController.to;

  final _urlFocusNode = FocusNode();
  final _totalFocusNode = FocusNode();
  final _timeFocusNode = FocusNode();
  final _moneyFocusNode = FocusNode();

  final _urlController = TextEditingController();
  final _totalController = TextEditingController();
  final _timeController = TextEditingController();
  final _moneyController = TextEditingController();
  DateTime? _finishAt;

  final fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    _urlController.text = _currentJob.url;
    _totalController.text = _currentJob.total.toString();
    _timeController.text = _currentJob.time.toString();
    _moneyController.text = _currentJob.money.toString();
    _finishAt = _currentJob.finishAt;
  }

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
        mainAxisSize: MainAxisSize.min,
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
            hintText: _currentJob.keyWord,
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
            hintText: _currentJob.baseUrl,
          ),
          VSpace.lg,
          CustomInput.outline(
            name: "url",
            controller: _urlController,
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
          CustomInput.outline(
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
            hintText: "${_currentJob.keyPage} - ${_currentJob.valuePage}",
          ),
          VSpace.lg,
          CustomInput.outline(
            controller: _totalController,
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
            focusNode: _totalFocusNode,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_totalFocusNode),
          ),
          VSpace.lg,
          CustomInput.outline(
            controller: _timeController,
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
            focusNode: _timeFocusNode,
            onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_timeFocusNode),
          ),
          VSpace.lg,
          CustomInput.outline(
            controller: _moneyController,
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
            initialDate: _currentJob.finishAt,
            labelText: "Ngày kết thúc",
            labelStyle: textStyle.copyWith(color: AppColor.primaryColor),
            prefixIcon: renderIcon(Icons.access_time_outlined),
            onChanged: (value) {
              if (value == null) return;
              _finishAt = value;
            },
          ),
          VSpace.lg,
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: CustomButton.fullColor(
                    width: double.infinity,
                    text: "APPLY",
                    padding: EdgeInsets.all(Insets.lg),
                    background: AppColor.primaryColor,
                    boxShadow: Shadows.universal,
                    onPressed: () {
                      if (!fbKey.currentState!.saveAndValidate()) {
                        return;
                      }
                      final job = _currentJob.copyWith(
                        url: _urlController.text,
                        total: int.parse(_totalController.text),
                        time: int.parse(_timeController.text),
                        money: int.parse(_moneyController.text),
                        finishAt: _finishAt,
                      );
                      _controller.editJob(context: context, job: job);
                    },
                  ),
                ),
                HSpace.med,
                if (!widget.hideDeleteButton)
                  Expanded(
                    child: CustomButton.fullColor(
                      width: double.infinity,
                      text: "DELETE",
                      padding: EdgeInsets.all(Insets.lg),
                      background: AppColor.errorColor,
                      boxShadow: Shadows.universal,
                      onPressed: () {
                        _controller.deleteJob(context: context, job: _currentJob);
                      },
                    ),
                  ),
              ],
            ),
          ),
          VSpace.lg,
        ],
      ),
    );
  }
}
