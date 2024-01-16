import 'package:flutter_modular/flutter_modular.dart';
import './modules/home/home_page.dart';
import 'core/rest_client/custom_dio.dart';
import 'modules/endereco/endereco_controller.dart';
import 'modules/endereco/endereco_page.dart';
import 'modules/template/base_layout.dart';
import 'services/endereco_service.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => CustomDio()),
        Bind.singleton((i) => EnderecoService(i())),
        Bind.singleton((i) => EnderecoController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const BaseLayout(
            body: RouterOutlet(),
          ),
          children: [
            ChildRoute(
              '/home',
              child: (_, __) => const HomePage(),
            ),
            ChildRoute(
              '/endereco',
              child: (_, __) => const EnderecoPage(),
            ),
          ],
        ),
      ];
}
