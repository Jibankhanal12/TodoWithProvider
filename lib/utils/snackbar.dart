import 'package:flutter/material.dart';

class Snackbar {
  static void showSnackbar(BuildContext context, String text) =>
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
}
