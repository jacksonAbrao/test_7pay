import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../styles/colors_app.dart';
import '../styles/theme_config.dart';

class DropDownButtonNoIcon extends StatefulWidget {
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final List<DropdownMenuItem<String>> items;
  final String name;
  final String label;
  final String placeholder;
  final void Function(String?)? onChanged;

  const DropDownButtonNoIcon({
    Key? key,
    required this.initialValue,
    this.validator,
    required this.items,
    required this.name,
    required this.label,
    required this.placeholder,
    this.onChanged,
  }) : super(key: key);

  @override
  State<DropDownButtonNoIcon> createState() => DropDownButtonNoIconState();
}

class DropDownButtonNoIconState<String> extends State<DropDownButtonNoIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderDropdown(
                initialValue: widget.initialValue,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  filled: true,
                  hintText: widget.placeholder,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  border: ThemeConfig.borderDefault,
                  enabledBorder: ThemeConfig.borderDefault.copyWith(
                    borderSide: const BorderSide(color: Color(0xffced4da)),
                  ),
                  focusedBorder: ThemeConfig.borderDefault.copyWith(
                    borderSide: BorderSide(color: context.colors.primary),
                  ),
                  errorBorder: ThemeConfig.borderDefault.copyWith(
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                // Isso faz com que o campo seja obrigatório
                validator: widget.validator,
                items: widget.items,
                onChanged: widget.onChanged,
                name: widget.name,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
