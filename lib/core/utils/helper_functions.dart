// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class HelperFunctions {

  static String truncateText(String text, int maxLength) {
    return text.length > maxLength
        ? '${text.substring(0, maxLength)}...'
        : text;
  }

  static Future<void> showModalBottomSheet({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
  }) async {
    return showModalBottomSheet(
      context: context,
      builder: builder,
    );
  }

  static String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
}

}
