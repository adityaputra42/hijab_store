import 'package:barakallah_hijab/core/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_color.dart';
import '../../theme/app_font.dart';

class InputText extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Color? color;
  final Color? filledColor;
  final Function()? ontaped;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLine;
  final Widget? crossTitle;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextStyle? titleStyle;
  final bool enable;
  final bool cursor;
  final bool autoFocus;
  final bool filled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? borderColor;
  final double? height;
  final TextAlign? textAlign;
  const InputText(
      {super.key,
      this.obscureText = false,
      this.title,
      this.initialValue,
      required this.hintText,
      this.enable = true,
      this.cursor = true,
      this.autoFocus = false,
      this.filled = false,
      this.onChange,
      this.ontaped,
      this.borderSide,
      this.textInputAction,
      this.icon,
      this.maxLine = 1,
      this.crossTitle,
      this.validator,
      this.controller,
      this.keyboardType,
      this.color,
      this.filledColor,
      this.inputFormatters,
      this.focusNode,
      this.prefixIcon,
      this.prefix,
      this.suffix,
      this.maxLength,
      this.textStyle,
      this.hintStyle,
      this.contentPadding,
      this.borderRadius,
      this.borderColor,
      this.height,
      this.textAlign,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? const SizedBox()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title ?? '',
                        style: titleStyle ??
                            AppFont.medium14.copyWith(
                              color: Theme.of(context).indicatorColor,
                            ),
                      ),
                      crossTitle ?? const SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: context.height(0.01),
                  )
                ],
              ),
        TextFormField(
            focusNode: focusNode,
            initialValue: initialValue,
            onChanged: onChange,
            validator: validator,
            autofocus: autoFocus,
            showCursor: cursor,
            textAlign: textAlign ?? TextAlign.start,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType,
            obscureText: obscureText,
            controller: controller,
            onTap: ontaped,
            maxLines: maxLine,
            maxLength: maxLength,
            style: textStyle ??
                AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
            decoration: InputDecoration(
              enabled: enable,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: icon,
              suffix: suffix,
              prefixIcon: prefixIcon,
              prefix: prefix,
              hintText: hintText,
              filled: filled,
              fillColor: filledColor,
              hintStyle: hintStyle ??
                  AppFont.reguler12
                      .copyWith(color: Theme.of(context).highlightColor),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    BorderSide(
                        color: borderColor ?? Colors.transparent, width: 1),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    BorderSide(
                        color: borderColor ?? Colors.transparent, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    BorderSide(
                        color: borderColor ?? Colors.transparent, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(8),
                borderSide: borderSide ??
                    const BorderSide(color: AppColor.primaryColor),
              ),
            )),
      ],
    );
  }
}
