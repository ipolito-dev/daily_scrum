import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class ModalBottomSheetWidget {
  static Future modalBottomSheet({
    required context,
    bool isScrollController = true,
    required Widget Function(BuildContext) builder,
  }) async {
    return await showModalBottomSheet(
      isScrollControlled: isScrollController,
      backgroundColor: ColorsTheme.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: builder,
    );
  }
}
