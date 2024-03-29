import 'package:flutter/material.dart';

class ModalBottomSheetWidget {
  static Future modalBottomSheet({
    required context,
    bool isScrollController = true,
    required Widget Function(BuildContext) builder,
  }) async {
    return await showModalBottomSheet(
      isScrollControlled: isScrollController,
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      context: context,
      builder: builder,
    );
  }
}
