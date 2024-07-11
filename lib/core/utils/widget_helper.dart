import 'package:flutter/material.dart';

import '../theme/app_font.dart';

class WidgetHelper {
  static appBar(
      {required BuildContext context,
      Function()? onTap,
      Function()? onTapTitle,
      required String title,
      Widget? icon,
      Widget? iconTitle,
      Color? color,
      double fontSize = 14,
      List<Widget>? actions,
      bool isCanBack = true}) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          isCanBack
              ? GestureDetector(
                  onTap: onTap ??
                      () {
                        Navigator.pop(context);
                      },
                  child: Container(
                    width: 36,
                    height: 36,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).canvasColor,
                        )),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).hintColor,
                      size: 16,
                    ),
                  ))
              : const SizedBox(
                  width: 36,
                ),
          Expanded(
            child: Text(
              title,
              style: AppFont.medium14.copyWith(
                  color: Theme.of(context).indicatorColor, fontSize: fontSize),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          icon ??
              const SizedBox(
                width: 36,
              ),
        ],
      ),
      actions: actions,
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Theme.of(context).colorScheme.surface,
      toolbarHeight: 60,
    );
  }
}
