import 'package:anime_app/core/utils/prints.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    printDebug("text");
    if (connectivityResult == ConnectivityResult.none) {
      printError("Here");
      Get.rawSnackbar(
        messageText: Text(
          "pleaseConnectToInternet".tr(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Colors.red[400]!,
        icon: Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 35.r,
        ),
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
