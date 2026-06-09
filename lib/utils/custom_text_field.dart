import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical/utils/color_constant.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Function(String)? onChanged;
  final String? errorText;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? enableInteractiveSelection;
  final bool? enabled;
  final int? maxLines;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final BorderSide? borderSide;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.onChanged,
    this.errorText,
    this.onTap,
    this.controller,
    this.initialValue,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.enableInteractiveSelection,
    this.enabled,
    this.focusNode,
    this.maxLines,
    this.textAlignVertical,
    this.textAlign,
    this.contentPadding,
    this.borderSide,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      enableInteractiveSelection: enableInteractiveSelection,
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      focusNode: focusNode,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        hintText: hintText,
        errorText: errorText,
        hintStyle: hintStyle ?? TextStyle(color: AppColors.grey500),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.transparent), // No border when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey500),
          borderRadius: BorderRadius.circular(18),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(18),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[300]!),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red[300]!),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
