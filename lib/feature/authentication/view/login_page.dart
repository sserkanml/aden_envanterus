import 'package:aden/core/util/utils.dart';
import 'package:aden/feature/authentication/controller/auth_mobx.dart';
import 'package:aden/feature/checks/controller/check_service.dart';
import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/item/controller/item_service.dart';
import 'package:aden/feature/projects/controller/projects_service.dart';
import 'package:aden/feature/root/controller/connectivity_service.dart';
import 'package:aden/feature/settings/controller/user_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobx/mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late RoundedLoadingButtonController roundedLoadingButtonController;
  late bool isError;
  bool isClosing = false;
  double gap = 20;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool isConnected = true;
  bool isFirstCheckConnect = true;
  bool isFirstTry = true;
  late FocusNode password;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    password = FocusNode();
    isError = false;

    roundedLoadingButtonController = RoundedLoadingButtonController();
    super.initState();
  }

  @override
  void didChangeDependencies()  {
   
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getAuht() async {
    await Modular.get<AuthMobx>().getLogin(
        email: emailController.text, password: passwordController.text);
    if (Modular.get<AuthMobx>().isLogin) {
      await Modular.get<MemberService>().getAllMember();
      await Modular.get<ItemService>().getAllItem();
      await Modular.get<CustomerService>().getAllCustomer();
      await Modular.get<ProjectService>().getAllProject();
      await Modular.get<CheckService>().getAllCheck();

      roundedLoadingButtonController.success();
      setState(() {
        isError = false;
      });
      Future.delayed(const Duration(milliseconds: 1000), () {
        Modular.to.pushReplacementNamed("/dashboard");
      });
    } else {
      roundedLoadingButtonController.error();
      setState(() {
        isError = true;
      });
      await Future.delayed(const Duration(milliseconds: 1000), () {
        roundedLoadingButtonController.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: top_side(context),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Hesab??na Giri?? Yap',
                      style: context.textTheme.headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hesab??na buradan giri?? yapabilirsin',
                      style: context.textTheme.bodyMedium!.copyWith(),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(password);
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    TextField(
                      controller: passwordController,
                      focusNode: password,
                      keyboardType: TextInputType.text,
                      obscureText: isClosing ? false : true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "??ifre",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isClosing = !isClosing;
                            });
                          },
                          icon: Icon(
                            isClosing ? Ionicons.eye_off : Ionicons.eye_outline,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    Row(
                      children: <Widget>[
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            '??ifremi Unuttum ?',
                            style: context.textTheme.bodyLarge!.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    ReactionBuilder(
                      builder: (context) {
                        return reaction(
                          delay: 1000,
                          (p0) => Modular.get<ConnectivityService>()
                              .connectivityStream
                              .value,
                          (p0) {
                            if (p0 == ConnectivityResult.none) {
                              isConnected = false;
                              isFirstTry = false;
                              setState(() {});
                            } else {
                              isConnected = true;
                              isFirstTry = false;
                              setState(() {});
                            }
                          },
                        );
                      },
                      child: RoundedLoadingButton(
                          width: context.dynamicWidth(1),
                          disabledColor: Colors.grey,
                          controller: roundedLoadingButtonController,
                          onPressed: isFirstTry
                              ? (Modular.get<ConnectivityService>()
                                      .isFirstConnected
                                  ? getAuht
                                  : null)
                              : (isConnected ? getAuht : null),
                          child: Text(
                            isFirstTry
                                ? (Modular.get<ConnectivityService>()
                                        .isFirstConnected
                                    ? 'Giri?? Yap'
                                    : "??nternet ba??lant??n??z?? kontrol edin")
                                : (isConnected
                                    ? 'Giri?? Yap'
                                    : "??nternet ba??lant??n??z?? kontrol edin"),
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    isError
                        ? Text(
                            'Kullan??c?? ad?? ya da ??ifre hatal??',
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.error,
                                fontWeight: FontWeight.bold),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Row top_side(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Image.asset(
              context.getPath(folder: "images", file: "envanterPure.png"),
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Envanterus',
              style: GoogleFonts.kalam(
                  fontSize: 28,
                  color: context.colorScheme.onSurface.withOpacity(.5)),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Kay??t Ol",
            style: context.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
