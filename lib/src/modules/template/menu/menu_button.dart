import 'package:flutter/material.dart';
import '../../../core/ui/styles/colors_app.dart';
import 'menu_enum.dart';

class MenuButton extends StatelessWidget {
  final Menu menu;
  final Menu? menuSelected;
  final ValueChanged<Menu> onPressed;
  const MenuButton({
    super.key,
    required this.menu,
    this.menuSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = menuSelected == menu;
    return LayoutBuilder(
      builder: (_, constrains) {
        return Visibility(
          visible: constrains.maxWidth > 60,
          replacement: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: isSelected
                ? BoxDecoration(
                    color: context.colors.primary50,
                    borderRadius: BorderRadius.circular(10),
                  )
                : null,
            child: Tooltip(
              message: menu.title,
              child: IconButton(
                onPressed: () => onPressed(menu),
                icon: Icon(
                  menu.icon,
                  color: Colors.white,
                ),
                color: context.colors.white,
              ),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onPressed(menu),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: isSelected
                    ? BoxDecoration(
                        color: context.colors.primary50,
                      )
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(menu.icon, color: context.colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        menu.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colors.white,
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
