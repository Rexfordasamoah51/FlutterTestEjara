import 'package:ejaratest/common/components/vertical_spacing.dart';
import 'package:ejaratest/common/values/color.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  /// Customised App Text Button
  ///
  /// All Properties can be null
  final String? label;
  final String? hintText;
  final bool? obscureText;
  final int? maxLines;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final String? errorText;

  const AppTextField({
    Key? key,
    this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.enabled,
    this.onFieldSubmitted,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.keyboardType,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label!,
              )
            : const SizedBox(),
        label != null ? const VerticalSpacing(16) : const SizedBox(),
        TextFormField(
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          textInputAction: textInputAction ?? TextInputAction.done,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          enabled: enabled,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2,
            suffixIcon: suffixIcon,
            errorText: errorText,
            contentPadding: const EdgeInsets.all(16.0),
            border: InputBorder.none,
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
