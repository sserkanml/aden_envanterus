import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late RoundedLoadingButtonController roundedLoadingButtonController;
  late bool isLoading;
   double gap = 10;
  @override
  void initState() {
    roundedLoadingButtonController = RoundedLoadingButtonController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getAuht() async {

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
                height: context.dynamicHeight(.05), child: top_side(context)),
            SizedBox(
              height: context.dynamicHeight(.95),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hesabına Giriş Yap',
                    style: context.textTheme.headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedLoadingButton(
                      width: context.dynamicWidth(1),
                      controller: roundedLoadingButtonController,
                      onPressed: getAuht,
                      child: const Text('Giriş Yap'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Row top_side(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Placeholder(
          fallbackHeight: 40,
          fallbackWidth: 40,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Kayıt Ol",
            style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
