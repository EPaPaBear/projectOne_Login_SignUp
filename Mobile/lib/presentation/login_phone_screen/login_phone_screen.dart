import 'controller/login_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';
import 'package:test/core/utils/validation_functions.dart';
import 'package:test/widgets/custom_button.dart';
import 'package:test/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginPhoneScreen extends GetWidget<LoginPhoneController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray200,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      width: getHorizontalSize(180.00),
                                      margin: getMargin(
                                          left: 78, top: 216, right: 78),
                                      child: Text("msg_please_fill_the".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold26
                                              .copyWith()))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 78, top: 35, right: 78),
                                      child: Text("lbl_email".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith()))),
                              CustomTextFormField(
                                  width: 296,
                                  focusNode: FocusNode(),
                                  controller: controller.emailController,
                                  hintText: "msg_dummyemail_doma".tr,
                                  margin:
                                      getMargin(left: 66, top: 18, right: 66),
                                  alignment: Alignment.center,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 78, top: 37, right: 78),
                                      child: Text("lbl_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith()))),
                              CustomTextFormField(
                                  width: 296,
                                  focusNode: FocusNode(),
                                  controller: controller.groupSevenController,
                                  hintText: "msg".tr,
                                  margin:
                                      getMargin(left: 66, top: 23, right: 66),
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.center,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      return "Please enter valid password";
                                    }
                                    return null;
                                  },
                                  isObscureText: true),
                              CustomButton(
                                  width: 161,
                                  text: "lbl_login".tr,
                                  margin:
                                      getMargin(left: 66, top: 62, right: 66),
                                  padding: ButtonPadding.PaddingAll11,
                                  onTap: onTapBtnLogin,
                                  alignment: Alignment.center),
                              Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtDonthaveana();
                                      },
                                      child: Padding(
                                          padding: getPadding(
                                              left: 66,
                                              top: 159,
                                              right: 66,
                                              bottom: 20),
                                          child: Text("msg_don_t_have_an_a".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith()))))
                            ])))))));
  }

  void onTapBtnLogin() {
    Map postAuthenticateReq = {
      'email': controller.emailController.text,
      'password': controller.groupSevenController.text,
    };
    controller.callCreateAuthenticate(
      postAuthenticateReq,
      successCall: _onCreateAuthenticateSuccess,
      errCall: _onCreateAuthenticateError,
    );
  }

  void _onCreateAuthenticateSuccess() {
    Get.toNamed(AppRoutes.dashboardPhoneScreen);
  }

  void _onCreateAuthenticateError() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: "Login Error",
        middleText: "Could not login");
  }

  onTapTxtDonthaveana() {
    Get.toNamed(AppRoutes.registerPhoneScreen);
  }
}
