import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerWrapper extends StatelessWidget {
  const CustomerWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RouterOutlet(),
    );
  }
}
