import '/core/app_export.dart';
import 'package:test/presentation/register_phone_screen/models/register_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:test/data/models/users/post_users_resp.dart';
import 'package:test/data/apiClient/api_client.dart';

class RegisterPhoneController extends GetxController {
  TextEditingController groupTwelveController = TextEditingController();

  TextEditingController emailController1 = TextEditingController();

  TextEditingController groupTenController = TextEditingController();

  TextEditingController groupNineController = TextEditingController();

  Rx<RegisterPhoneModel> registerPhoneModelObj = RegisterPhoneModel().obs;

  PostUsersResp postUsersResp = PostUsersResp();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupTwelveController.dispose();
    emailController1.dispose();
    groupTenController.dispose();
    groupNineController.dispose();
  }

  void callCreateUsers(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().createUsers(
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
        },
        onSuccess: (resp) {
          onCreateUsersSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateUsersError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateUsersSuccess(var response) {
    postUsersResp = PostUsersResp.fromJson(response);
  }

  void onCreateUsersError(var err) {
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
