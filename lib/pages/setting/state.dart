import 'package:get/get.dart';
import 'package:emo_boss/pages/pages.dart';

class SettingState {
  final Rx<TemplateTypeWeb> selectedValue =
      Rx<TemplateTypeWeb>(TemplateTypeWeb.donHang5880);
  final RxList<dynamic> tempalteKeyWeb = RxList<dynamic>(const []);
}
