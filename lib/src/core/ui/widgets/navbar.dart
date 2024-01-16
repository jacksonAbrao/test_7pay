import 'package:flutter/material.dart';
import '../../../modules/template/menu/menu_enum.dart';

import '../helpers/size_extensions.dart';
import '../styles/colors_app.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem> listMenus = [
      const PopupMenuItem(
        value: 'perfil',
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text('Ver Perfil'),
        ),
      ),
      const PopupMenuItem(
        value: 'configuracoes',
        child: ListTile(
          leading: Icon(Icons.settings),
          title: Text('Configurações'),
        ),
      ),
    ];
    if (context.screenWidth < 900) {
      for (var menu in Menu.values) {
        listMenus.add(
          PopupMenuItem(
            value: menu.route,
            onTap: () {
              Navigator.of(context).pushNamed(menu.route);
            },
            child: ListTile(
              leading: Icon(menu.icon),
              title: Text(menu.title),
            ),
          ),
        );
      }
    }

    listMenus.add(
      const PopupMenuItem(
        value: 'sair',
        child: ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Sair'),
        ),
      ),
    );

    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colors.dark,
        border: Border(
          bottom: BorderSide(
            color: context.colors.light,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/img/logo-7pay.png', width: 100),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Olá, Jackson Abrão',
                    style: TextStyle(
                      color: context.colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Seja bem vindo!',
                    style: TextStyle(
                      color: context.colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: context.colors.white,
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(100, 70, 0, 0),
                      items: listMenus,
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/avatar.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: context.colors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension NavbarExtensions on BuildContext {
  Navbar get navbar => const Navbar();
}
