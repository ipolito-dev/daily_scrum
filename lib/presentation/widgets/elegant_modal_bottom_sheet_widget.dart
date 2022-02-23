import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalSheet {
  static Future elegantModalBottomSheet({
    required context,
    bool isScrollController = true,
    bool isDismissible = true,
    required Widget Function(BuildContext) builder,
  }) async {
    return await showModalBottomSheet(
      isScrollControlled: isScrollController,
      backgroundColor: Get.context!.theme.colorScheme.background,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: builder,
    );
  }
}
