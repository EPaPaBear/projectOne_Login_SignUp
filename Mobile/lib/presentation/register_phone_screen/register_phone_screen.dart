import 'controller/register_phone_controller.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';
import 'package:test/core/utils/validation_functions.dart';
import 'package:test/widgets/custom_button.dart';
import 'package:test/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterPhoneScreen extends GetWidget<RegisterPhoneController> {
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
                                          left: 78, top: 92, right: 78),
                                      child: Text("msg_please_fill_the2".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold26
                                              .copyWith()))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 78, top: 47, right: 78),
                                      child: Text("lbl_name".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith()))),
                              CustomTextFormField(
                                  width: 296,
                                  focusNode: FocusNode(),
                                  controller: controller.groupTwelveController,
                                  hintText: "msg_john_doe_smith".tr,
                                  margin:
                                      getMargin(left: 66, top: 17, right: 66),
                                  padding: TextFormFieldPadding.PaddingT21,
                                  alignment: Alignment.center,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isText(value, isRequired: true))) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  }),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 78, top: 28, right: 78),
                                      child: Text("lbl_email".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith()))),
                              CustomTextFormField(
                                  width: 296,
                                  focusNode: FocusNode(),
                                  controller: controller.emailController1,
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
                                          left: 78, top: 27, right: 78),
                                      child: Text("lbl_phone".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith()))),
                              CustomTextFormField(
                                  width: 296,
                                  focusNode: FocusNode(),
                                  controller: controller.groupTenController,
                                  hintText: "lbl_2331234567".tr,
                                  margin:
                                      getMargin(left: 66, top: 18, right: 66),
                                  alignment: Alignment.center,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isText(value, isRequired: true))) {
                                      return "Please enter valid text";
                                    }
                                    return null;
                                  }),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 78, top: 28, right: 78),
                                      child: Text("lbl_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsRegular20
                                              .copyWith()))),
                              CustomTextFormField(
                                  width: 296,
                                  focusNode: FocusNode(),
                                  controller: controller.groupNineController,
                                  hintText: "msg".tr,
                                  margin:
                                      getMargin(left: 66, top: 23, right: 66),
                                  padding: TextFormFieldPadding.PaddingT21,
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
                                  width: 205,
                                  text: "lbl_register".tr,
                                  margin:
                                      getMargin(left: 66, top: 53, right: 66),
                                  onTap: onTapBtnRegister,
                                  alignment: Alignment.center),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtAlreadyhavean();
                                      },
                                      child: Padding(
                                          padding: getPadding(
                                              left: 70,
                                              top: 40,
                                              right: 70,
                                              bottom: 20),
                                          child: Text("msg_already_have_an".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtPoppinsRegular16
                                                  .copyWith()))))
                            ])))))));
  }

  void onTapBtnRegister() {
    Map postUsersReq = {};
    controller.callCreateUsers(
      postUsersReq,
      successCall: _onCreateUsersSuccess,
      errCall: _onCreateUsersError,
    );
  }

  void _onCreateUsersSuccess() {
    Get.find<PrefUtils>().setName(controller.postUsersResp.message!.toString());
    Get.toNamed(AppRoutes.dashboardPhoneScreen);
  }

  void _onCreateUsersError() {
    Get.defaultDialog(
        onConfirm: () => Get.back(),
        title: "Registration Error",
        middleText:
            "Could not register right now. Please try again after some time.");
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.loginPhoneScreen);
  }
}
