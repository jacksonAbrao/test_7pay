import 'package:flutter/material.dart';
import 'menu/sidebar_menu.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/widgets/navbar.dart';

class BaseLayout extends StatefulWidget {
  final Widget body;
  const BaseLayout({
    super.key,
    required this.body,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Column(
          children: [
            const Navbar(),
            if (context.screenWidth > 900)
              Row(
                children: [
                  const SidebarMenu(),
                  Expanded(
                    child: SizedBox(
                      height: context.screenHeight - 100,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: widget.body,
                      ),
                    ),
                  ),
                ],
              )
            else
              Expanded(
                child: SizedBox(
                  height: context.screenHeight - 100,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: widget.body,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
