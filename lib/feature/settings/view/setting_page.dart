import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:aden/feature/root/controller/page_navigation.dart';
import 'package:aden/feature/settings/model/list_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../authentication/controller/auth_mobx.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ayarlar',
                  style: context.textTheme.headline6!.copyWith(),
                ),
                SwitcherButton(
                    onChange: (value) {
                      if (AdaptiveTheme.of(context).mode ==
                          AdaptiveThemeMode.light) {
                        AdaptiveTheme.of(context).setDark();
                      } else {
                        AdaptiveTheme.of(context).setLight();
                      }
                    },
                    onColor: context.colorScheme.primary,
                    offColor: context.colorScheme.outline,
                    size: 55,
                    value: AdaptiveTheme.of(context).mode ==
                            AdaptiveThemeMode.light
                        ? false
                        : true)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        context.colorScheme.onSurface.withOpacity(.08),
                    child: Center(
                      child: Text(
                        'SN',
                        style: context.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Bisod Bilişim Hizmetleri Ticaret A.Ş.',
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Serkan Namlı',
                  style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurface.withOpacity(.4)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.dynamicWidth(1),
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Yükseltme Seçeneklerini Görün",
                  style: context.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    if (index == settingListData.length - 1) {
                      logOutDialog(context);
                    } else {
                      Modular.to.pushNamed(settingListData[index].path);
                    }
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 0.0,
                  ),
                  leading: Icon(
                    settingListData[index].icon,
                    size: 22,
                    color: context.colorScheme.onSurface.withOpacity(.7),
                  ),
                  title: Text(
                    settingListData[index].label,
                    style: context.textTheme.bodyMedium,
                  ),
                );
              },
              itemCount: settingListData.length,
            )
          ],
        ),
      )),
    );
  }

  Future<dynamic> logOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            SizedBox(
              width: context.dynamicWidth(.3),
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: const Text(
                  "İptal",
                ),
              ),
            ),
            SizedBox(
              width: context.dynamicWidth(.3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Modular.get<UserSession>().userSession = "";
                  Modular.get<AuthMobx>().isLogin = false;
                  Modular.get<PageNavigation>().changePage(0);
                  Modular.to.pushNamedAndRemoveUntil(
                      "/authentication", (p0) => false);
                },
                child: Text(
                  "Çıkış",
                  style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.primary),
                ),
              ),
            ),
          ],
          content: Text(
            "Uygulamadan çıktığınızda kaydedilmemiş veriler silinmiş olacaktır.",
            style: context.textTheme.bodySmall,
          ),
          title: Text(
            'Uygulamadan Çıkmak İstediğinize Emin Misiniz ?',
            style: context.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
