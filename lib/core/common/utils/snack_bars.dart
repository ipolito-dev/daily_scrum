import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SnackBars {
  static SnackbarController errorSnackBar({
    required String? msg,
    Duration? duration = const Duration(seconds: 15),
    Function? onClose,
  }) {
    return Get.snackbar(
      'Erro',
      '$msg',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red[400],
      duration: duration,
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSING) onClose?.call();
      },
      onTap: (snack) {
        if (Get.isSnackbarOpen) {
          Get.back();
        }
      },
      colorText: Colors.white,
    );
  }

  static successSnackBar({
    required String? msg,
    Duration? duration,
    Function? onClose,
  }) {
    return Get.snackbar(
      'Sucesso',
      '$msg',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green[400],
      duration: duration,
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSING) {
          Future.delayed(const Duration(milliseconds: 250), () {
            onClose?.call();
          });
        }
      },
      onTap: (snack) {
        if (Get.isSnackbarOpen) {
          Get.back();
        }
      },
      colorText: Colors.white,
    );
  }

  static SnackbarController warningSnackBar({
    required String? msg,
    Duration? duration,
    Function? onClose,
  }) {
    return Get.snackbar(
      'Aviso',
      '$msg',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.yellow[400],
      duration: duration,
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSING) onClose?.call();
      },
      onTap: (snack) {
        if (Get.isSnackbarOpen) {
          Get.back();
        }
      },
      colorText: Colors.black,
    );
  }

  static SnackbarController infoSnackBar({
    required String? msg,
    Duration? duration,
    Function? onClose,
  }) {
    return Get.snackbar(
      'Atenção',
      '$msg',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue[400],
      duration: duration,
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSING) onClose?.call();
      },
      onTap: (snack) {
        if (Get.isSnackbarOpen) {
          Get.back();
        }
      },
      colorText: Colors.white,
    );
  }

  static SnackbarController loadSnackBar({required String? msg}) {
    return Get.snackbar(
      'Aguarde...',
      '$msg',
      snackPosition: SnackPosition.TOP,
      isDismissible: false,
      duration: const Duration(minutes: 1),
      overlayBlur: 1,
      overlayColor: Colors.black45,
      icon: Container(
        height: 40,
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator(
          backgroundColor: Colors.white10,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue[400],
      colorText: Colors.white,
    );
  }
}
