import 'package:emo_boss/common/generated/l10n.dart';
import 'package:emo_boss/common/store/store.dart';
import 'package:emo_boss/common/theme/theme.dart';
import 'package:emo_boss/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  SignUpController();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final rePassController = TextEditingController();
  final fbKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<bool> handleSignUp() async =>
      await Loading.openAndDismissLoading<bool>(
        () async {
          try {
            //Get serial device
            await UserStore.to.onSignUp(
              fullName: fullNameController.text,
              email: emailController.text,
              userName: userController.text,
              passwords: passController.text,
            );
            CustomSnackBar.success(
              title: S.current.Thanh_cong,
              message: S.current.Dang_nhap_thanh_cong,
            );
            return true;
          } catch (e) {
            return false;
          }
        },
      ) ??
      false;

}
