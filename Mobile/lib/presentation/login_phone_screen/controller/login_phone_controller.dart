import '/core/app_export.dart';
import 'package:test/presentation/login_phone_screen/models/login_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:test/data/models/authenticate/post_authenticate_resp.dart';
import 'package:test/data/apiClient/api_client.dart';

class LoginPhoneController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController groupSevenController = TextEditingController();

  Rx<LoginPhoneModel> loginPhoneModelObj = LoginPhoneModel().obs;

  List<PostAuthenticateResp> postAuthenticateResp = <PostAuthenticateResp>[];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    groupSevenController.dispose();
  }

  void callCreateAuthenticate(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().createAuthenticate(
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
        },
        onSuccess: (resp) {
          onCreateAuthenticateSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateAuthenticateError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateAuthenticateSuccess(var response) {
    postAuthenticateResp = (response as List)
        .map((e) => PostAuthenticateResp.fromJson(e))
        .toList();
  }

  void onCreateAuthenticateError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
