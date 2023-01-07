import 'package:aden/feature/customers/view/customer_page.dart';
import 'package:aden/feature/customers/view/customer_wrapper.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerModule extends Module{

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args) => CustomerWrapper(),children: [
      ChildRoute("/customers", child: (context, args) => CustomerPage(),)
    ])
  ];
}