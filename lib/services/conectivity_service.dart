import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  bool isShowingDialog = false;

  @override
  void onInit() async {
    super.onInit();
    print('initService Connectivity');
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      isShowingDialog = true;
      showDialog();
    }

    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        isShowingDialog = true;
        showDialog();
      } else {
        if (isShowingDialog) {
          Get.back();
          isShowingDialog = false;
        }
      }
    });
  }

  void showDialog() {
    Get.snackbar('Connection Error',
        'Please turn on network connection to continue using this app');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('Close service Connectivity');
  }
}
