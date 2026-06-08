import 'package:flutter/material.dart';

import 'app_styles.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: Theme.of(context).primaryColor),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(message, style: AppStyles.semi20Primary()),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
            if (posAction != null) Future.microtask(() => posAction.call());
          },
          child: Text(posActionName, style: AppStyles.semi20Primary()),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
            if (negAction != null) Future.microtask(() => negAction.call());
          },
          child: Text(negActionName, style: AppStyles.semi20Primary()),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message, style: AppStyles.semi20Primary()),
          title: Text(
            title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: actions,
        );
      },
    );
  }
}
