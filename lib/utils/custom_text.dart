import 'package:flutter/material.dart';
import 'package:practical/utils/color_constant.dart';

/// Custom Text Widget
class CustomText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextStyle? style;
  final bool? softWrap;
  final bool fontStyleItalic;
  final String? fontFamily;
  final Color? decorationColor;
  final double? decorationThickness;
  const CustomText({
    super.key,
    required this.title,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.color = AppColors.black,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.softWrap,
    this.fontStyleItalic = false,
    this.fontFamily,
    this.decorationColor,
    this.decorationThickness,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      softWrap: softWrap,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style:
          style ??
          TextStyle(
            fontFamily: fontFamily ?? 'poppins', // default font family is poppins
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: decoration,
            fontStyle: fontStyleItalic ? FontStyle.italic : FontStyle.normal,
            decorationColor: decorationColor,
            decorationThickness: decorationThickness,
          ),
    );
  }
}

/// Expandable Text Widget with show more and show less functionality
class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;

  const ExpandableText({super.key, required this.text, this.trimLines = 3, this.style});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;
  bool _isOverflowing = false;

  final _textKey = GlobalKey();

  @override
  void didUpdateWidget(covariant ExpandableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _checkOverflow();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOverflow());
  }

  void _checkOverflow() {
    final renderObject = _textKey.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final span = TextSpan(text: widget.text, style: widget.style);
      final tp = TextPainter(text: span, maxLines: widget.trimLines, textDirection: TextDirection.ltr)
        ..layout(maxWidth: renderObject.size.width);
      final didOverflow = tp.didExceedMaxLines;

      if (didOverflow != _isOverflowing) {
        setState(() {
          _isOverflowing = didOverflow;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              key: _textKey,
              style: widget.style,
              maxLines: _isExpanded ? null : widget.trimLines,
              overflow: TextOverflow.fade,
            ),
            if (_isOverflowing)
              GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: Text(_isExpanded ? 'show less' : 'show more', style: widget.style?.copyWith(color: AppColors.black)),
              ),
          ],
        );
      },
    );
  }
}
