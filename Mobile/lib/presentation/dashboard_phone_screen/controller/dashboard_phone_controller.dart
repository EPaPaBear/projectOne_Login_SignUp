import '/core/app_export.dart';
import 'package:test/presentation/dashboard_phone_screen/models/dashboard_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:test/data/models/logout/post_logout_resp.dart';
import 'package:test/data/apiClient/api_client.dart';

class DashboardPhoneController extends GetxController {
  Rx<DashboardPhoneModel> dashboardPhoneModelObj = DashboardPhoneModel().obs;

  PostLogoutResp postLogoutResp = PostLogoutResp();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void callCreateLogout(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().createLogout(
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
        },
        onSuccess: (resp) {
          onCreateLogoutSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateLogoutError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateLogoutSuccess(var response) {
    postLogoutResp = PostLogoutResp.fromJson(response);
  }

  void onCreateLogoutError(var err) {
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
