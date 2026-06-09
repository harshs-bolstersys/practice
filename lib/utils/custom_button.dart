// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:practical/utils/color_constant.dart';
import 'package:practical/utils/mq.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool outlined;
  final bool loading;
  final Widget? leading;
  final double? fontSize;
  final double? verticalPadding;
  final double? height;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.black,
    this.borderColor = AppColors.black,
    this.textColor = AppColors.white,
    this.outlined = false,
    this.loading = false,
    this.leading,
    this.fontSize,
    this.verticalPadding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MQ.h(6),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            outlined ? Colors.transparent : (loading ? AppColors.grey500 : backgroundColor),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: outlined ? (loading ? AppColors.grey500 : borderColor) : (loading ? AppColors.grey500 : backgroundColor),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        onPressed: loading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[leading!, SizedBox(width: MQ.w(2))],
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: outlined ? (textColor != AppColors.white ? textColor : AppColors.black) : textColor,
                  fontSize: fontSize ?? MQ.w(4.2),
                  fontFamily: 'poppins',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
