import 'package:aden/feature/checks/view/checks_wrapper.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view/chekcs_page.dart';

class ChecksModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => const ChecksWrapper(),
            children: [
              ChildRoute(
                "/checks",
                child: (context, args) => const ChekcsPage(),
              )
            ])
      ];
}
