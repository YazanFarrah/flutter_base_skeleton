import 'package:anime_app/config/app_colors.dart';
import 'package:anime_app/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool? isPass;
  final TextInputType? keyType;
  final int? maxLength;
  final double? radius;
  final double? contentPadding;
  final double? verticalPadding;
  final FormFieldValidator? validator;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? filled;
  final bool? hasBorderSide;
  final bool? enabled;
  final Widget? suffix;
  final bool? numbersOnly;
  final TextInputAction? textInputAction;

  const CustomFormField({
    super.key,
    this.hintText,
    required this.controller,
    this.isPass,
    this.keyType,
    this.maxLength,
    this.radius,
    this.contentPadding,
    this.verticalPadding,
    this.validator,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.filled,
    this.hasBorderSide = false,
    this.enabled,
    this.onChanged,
    this.suffix,
    this.numbersOnly,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final isTab =
        Responsive.isLargeTablet == true || Responsive.isTablet == true;
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      inputFormatters: [
        if (numbersOnly == true) FilteringTextInputFormatter.digitsOnly
      ],
      enabled: enabled ?? true,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      keyboardType: keyType,
      obscureText: isPass ?? false,
      controller: controller,
      textInputAction: textInputAction,
      maxLines: 1,
      decoration: InputDecoration(
        // fillColor: filled != null ? textFieldFillColor : null,
        suffixIcon: suffix,
        filled: filled ?? false,
        errorMaxLines: 1,
        errorBorder: OutlineInputBorder(
          borderSide: hasBorderSide == true
              ? BorderSide(color: SharedColors.redColor)
              : BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              hasBorderSide == true ? const BorderSide() : BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              hasBorderSide == true ? const BorderSide() : BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: hasBorderSide == true
              ? const BorderSide(color: Color(0XFFCBD5E1))
              : BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: contentPadding ?? 0,
          vertical: verticalPadding == null
              ? isTab
                  ? 20.h
                  : 0
              : 0,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: hasBorderSide == true
              ? const BorderSide(color: Color(0XFFCBD5E1))
              : BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
        ),
        hintText: hintText,
      ),
    );
  }
}
