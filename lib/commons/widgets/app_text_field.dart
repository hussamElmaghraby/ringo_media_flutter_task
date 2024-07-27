import 'package:flutter/material.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      this.label,
      this.isPassword = false,
      this.validator, this.onChanged});

  final TextEditingController controller;
  final String? label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)?  onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool notVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? '',
          style: context.apptextTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.disabled,
          style: context.apptextTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
          obscureText: widget.isPassword && notVisible,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            suffix: widget.isPassword ? GestureDetector(
              onTap: () {
                setState(
                  () {
                    notVisible = !notVisible;
                  },
                );
              },
              child: notVisible
                  ? const Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
            ) : null,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
