import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;

  // funciones on change y validator
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  final Function? prefixIconOnPressed;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.prefixIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: colors.primary) : null,
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: colors.primary) : null,
        // icon: Icon(Icons.abc, color: colors.primary),
      ),
    );
  }
}
