import 'package:flutter_modular/flutter_modular.dart';

import '../view/items_page.dart';

class ItemModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const ItemsPage(),
        )
      ];
}
