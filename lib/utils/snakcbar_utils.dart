import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showSnackbar(
      BuildContext context, IconData icon, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Color(0xff18DAA3)),
            SizedBox(width: 8),
            Text(message),
          ],
        ),
      ),
    );
  }
}
