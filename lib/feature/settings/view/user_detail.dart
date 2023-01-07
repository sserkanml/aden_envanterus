import 'package:aden/feature/settings/model/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';
import 'package:select_form_field/select_form_field.dart';

class UserDetail extends StatefulWidget {
  final Member member;
  const UserDetail({Key? key, required this.member}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late String dropDownValue;
  @override
  void initState() {
    dropDownValue = widget.member.yetki == 0 ? "Kulllanıcı" : "Admin";
    print(dropDownValue);
    passwordController = TextEditingController();
    userNameController = TextEditingController();

    nameController = TextEditingController();
    nameController.text = widget.member.adiSoyadi ?? " ";
    passwordController.text = widget.member.kullaniciSifre ?? " ";
    userNameController.text = widget.member.kullaniciAdi ?? " ";
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  double gap = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(FontAwesomeIcons.user),
          )
        ],
        title: Text(
          'Kullanıcı Detay',
          style: context.textTheme.headline6,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                GFButton(
                  onPressed: () {},
                  child: Text(
                    'Proje Ata',
                    style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: gap,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Ad Soyad",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(
                  labelText: "Kullanıcı Adı",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: "Şifre",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            SelectFormField(
              initialValue: dropDownValue,
              decoration: const InputDecoration(
                  hintText: "Lütfen Yetki Seçiniz",
                  labelText: "Yetki Durumu",
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  dropDownValue = value;
                });
              },
              items: const [
                {
                  'value': "Kullanıcı",
                  'label': "Kullanıcı",
                },
                {
                  'value': "Admin",
                  'label': "Admin",
                },
              ],
              type: SelectFormFieldType.dropdown,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Spacer(),
                GFButton(
                  color: GFColors.SECONDARY,
                  onPressed: () {},
                  child: Text(
                    'Düzenle',
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
