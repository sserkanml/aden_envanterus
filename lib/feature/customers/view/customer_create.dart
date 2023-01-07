import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';

class CustomerCreatePage extends StatefulWidget {
  const CustomerCreatePage({Key? key}) : super(key: key);

  @override
  State<CustomerCreatePage> createState() => _CustomerCreatePageState();
}

class _CustomerCreatePageState extends State<CustomerCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Müşteri Oluştur',
          style: context.textTheme.headline6,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: <Widget>[
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Not Yaz",
                  alignLabelWithHint: true,
                  labelText: "Not"),
            ),
          ],
        )),
      )),
    );
  }
}
