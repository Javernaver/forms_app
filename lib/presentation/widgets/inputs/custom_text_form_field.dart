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

  final void Function()? suffixIconOnPressed;

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
    this.suffixIconOnPressed,
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
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color:
                    errorMessage != null ? Colors.red.shade800 : colors.primary,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: errorMessage != null
                      ? Colors.red.shade800
                      : colors.primary,
                ),
                onPressed: suffixIconOnPressed,
              )
            : null,
        // icon: Icon(Icons.abc, color: colors.primary),
      ),
    );
  }
}
