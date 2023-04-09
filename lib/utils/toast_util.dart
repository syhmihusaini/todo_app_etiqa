import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ToastUtil {
  static void snackBar({required String title, required String message}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    String asset = 'assets/icons/success.svg';
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      dismissDirection: DismissDirection.none,
      borderWidth: 1,
      margin: const EdgeInsets.only(bottom: 100, left: 50, right: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      borderRadius: 6,
      icon: SvgPicture.asset(asset, height: 30, width: 30, color: Colors.green),
      instantInit: true,
      isDismissible: true,
      maxWidth: Get.width * 0.65,
      animationDuration: const Duration(milliseconds: 50),
      forwardAnimationCurve: Curves.easeOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
      shouldIconPulse: true,
      boxShadows: <BoxShadow>[
        BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 3, blurRadius: 5, offset: const Offset(0, 5)),
      ],
      titleText: Transform.translate(
        offset: const Offset(0, 1),
        child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      messageText: Transform.translate(
        offset: const Offset(0, -2.5),
        child: Text(message, style: const TextStyle(color: Colors.white, fontSize: 15)),
      ),
      onTap: (GetSnackBar snack) {
        Get.closeCurrentSnackbar();
      },
    );
  }
}
