import 'package:barakallah_hijab/core/utils/double_extension.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/app_font.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.title,
      thiseight,
      this.width = double.infinity,
      this.margin = EdgeInsets.zero,
      required this.onPressed,
      this.disable = false,
      this.activeColor = AppColor.primaryColor,
      this.disableColor = AppColor.primaryColor,
      this.bgColor,
      this.textColor,
      this.loading = false,
      this.useExpanded = false,
      this.child,
      this.borderRadius,
      this.borderWidth,
      this.borderColor,
      this.textStyle,
      this.buttonPadding,
      this.height});

  final String title;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets? buttonPadding;
  final double? height;
  final Function() onPressed;
  final Color activeColor;
  final Color disableColor;
  final Color? bgColor;
  final TextStyle? textStyle;
  final bool disable;
  final bool loading;

  final Widget? child;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? textColor;
  final bool? useExpanded;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 42,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: Border.all(
            width: borderWidth ?? 0, color: borderColor ?? Colors.transparent),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              disable ? disableColor.withOpacity(0.35) : activeColor,
          foregroundColor: AppColor.darkText1,
          padding: buttonPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
        onPressed: disable || loading ? () {} : onPressed,
        child: child ??
            (loading
                ? Padding(
                    padding: EdgeInsets.all(context.height(0.02)),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.darkText1,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: textStyle ??
                        AppFont.medium14.copyWith(
                          color: textColor ?? AppColor.darkText1,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
      ),
    );
  }
}
