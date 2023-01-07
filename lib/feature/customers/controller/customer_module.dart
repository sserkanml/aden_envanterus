import 'package:aden/feature/customers/view/customer_create.dart';
import 'package:aden/feature/customers/view/customer_detail.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const CustomerCreatePage(),
        ),
        ChildRoute(
          "/customer-detail",
          child: (context, args) => CustomerDetailPage(customer: args.data),
        )
      ];
}
