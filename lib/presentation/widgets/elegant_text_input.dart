import 'package:daily_scrum/core/common/utils/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ElegantTextInputWidget extends StatelessWidget {
  final String? text;
  final int? maxLength;
  final int maxLines;
  final String counterText;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final TextStyle? textStyle;
  final String? errorText;
  final List<TextInputFormatter>? inputMask;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;

  ///required inform the attribute text to work
  final bool showTitle;

  final EdgeInsets padding;

  const ElegantTextInputWidget({
    Key? key,
    this.text,
    this.readOnly = false,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.counterText = "",
    this.obscureText = false,
    this.onChanged,
    this.textStyle = const TextStyle(color: Colors.grey),
    this.hintStyle = const TextStyle(color: Colors.grey),
    this.errorText,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    this.labelStyle = const TextStyle(color: Colors.black),
    this.inputMask,
    this.showTitle = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showTitle && text != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "$text",
              textScaleFactor: 1.1,
              style: theme.textTheme.bodyText1,
            ),
          ),
        ),
        Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor ?? theme.colorScheme.secondaryVariant.withAlpha(100),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            onTap: () {
              if (readOnly) {
                SnackBars.warningSnackBar(msg: "Campo desabilitado!");
              }
            },
            controller: controller,
            onChanged: onChanged,
            maxLines: maxLines,
            maxLength: maxLength,
            style: theme.textTheme.bodyText1,
            keyboardType: textInputType,
            obscureText: obscureText,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(
                  color: theme.textTheme.bodyText1!.color!.withAlpha(170)),
              errorText: errorText,
              border: InputBorder.none,
              counterText: counterText,
            ),
            inputFormatters: inputMask == null ? null : inputMask!,
          ),
        ),
      ],
    );
  }
}
