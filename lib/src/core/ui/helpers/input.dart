// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/theme_config.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextInputAction? textInputAction;
  final Future<void> Function(dynamic)? onFieldSubmitted;
  final Function()? onTap;
  final Function(String)? onChanged;
  final String? initialValue;
  final String? text;
  final bool? enable;
  final TextInputType? inputMode;
  final TextInputFormatter? formato;
  final int? maxLength;
  final bool bgCinza;
  final Widget? widgetExtraLabel;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final Color? borderColor;
  bool? uppercase = false;

  Input({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.text,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.onTap,
    this.onChanged,
    this.initialValue,
    this.formato,
    this.inputMode,
    this.maxLength,
    this.enable = true,
    this.onEditingComplete,
    this.focusNode,
    this.borderColor,
    this.uppercase,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        bgCinza = false,
        widgetExtraLabel = null;

  Input.borderColor({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.text,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.onTap,
    this.onChanged,
    this.initialValue,
    this.formato,
    this.inputMode,
    this.maxLength,
    this.enable = true,
    required this.widgetExtraLabel,
    this.onEditingComplete,
    this.focusNode,
    this.borderColor,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        bgCinza = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (widgetExtraLabel != null) widgetExtraLabel!,
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    inputFormatters: formato != null
                        ? [
                            FilteringTextInputFormatter.digitsOnly,
                            formato!,
                          ]
                        : [],
                    controller: controller,
                    enableInteractiveSelection: true,
                    initialValue: initialValue,
                    obscureText: obscureTextVNValue,
                    textInputAction: textInputAction,
                    validator: validator,
                    onFieldSubmitted: onFieldSubmitted,
                    enabled: enable,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: inputMode,
                    textCapitalization: uppercase != null && uppercase!
                        ? TextCapitalization.characters
                        : TextCapitalization.none,
                    decoration: InputDecoration(
                      counterText: "",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      filled: true,
                      fillColor: !bgCinza
                          ? enable == true
                              ? Colors.white
                              : const Color(0xFFEAEAEA)
                          : const Color(0xFFEAEAEA),
                      hintText: text,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      border: ThemeConfig.borderDefault,
                      enabledBorder: borderColor != null
                          ? ThemeConfig.borderDefault.copyWith(
                              borderSide: BorderSide(color: borderColor!),
                            )
                          : ThemeConfig.borderDefault,
                      focusedBorder: ThemeConfig.borderDefault.copyWith(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      disabledBorder: ThemeConfig.borderDefault.copyWith(
                        borderSide: const BorderSide(
                          color: Color(0xFFEAEAEA),
                        ),
                      ),
                      errorBorder: ThemeConfig.borderDefault.copyWith(
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      suffixIcon: obscureText
                          ? IconButton(
                              onPressed: () {
                                _obscureTextVN.value = !obscureTextVNValue;
                              },
                              icon: Icon(
                                obscureTextVNValue
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                    onTap: onTap,
                    onChanged: onChanged,
                    maxLength: maxLength,
                    onEditingComplete: onEditingComplete,
                    focusNode: focusNode,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
