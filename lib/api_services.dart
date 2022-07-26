import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Services extends GetConnect {
  getResponse(url, [Map<String, String>? headers]) async {
    try {
      Response response = await get(url, headers: headers);
      if (response.statusCode == 502) {
        Get.snackbar(
          "Something went wrong!",
          "Please try again after sometime",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      return response;
    } on SocketException {
      Get.snackbar(
        "No Internet connection",
        "Please turn on your internet connection",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Something went wrong!",
        "Please try again after sometime",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
