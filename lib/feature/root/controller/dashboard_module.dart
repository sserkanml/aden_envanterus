import 'package:aden/feature/root/view/dashboard_page.dart';
import 'package:aden/feature/root/view/dashboard_wrapper.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, args) => const DashboardWrapper(),
            children: [
              ChildRoute(
                "/dashboard",
                child: (context, args) => const DashboardPage(),
              )
            ])
      ];
}
