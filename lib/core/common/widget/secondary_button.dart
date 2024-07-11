import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/app_font.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.height = 42,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderColor,
    this.textColor,
    this.bgColor,
    this.loading = false,
    required this.onPressed,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;

  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final bool loading;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(
                width: 1, color: borderColor ?? AppColor.primaryColor),
            backgroundColor: bgColor ?? Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: loading ? () {} : onPressed,
        child: loading
            ? const Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
              ),
      ),
    );
  }
}
