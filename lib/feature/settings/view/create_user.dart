import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kartal/kartal.dart';
import 'package:select_form_field/select_form_field.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late FocusNode userNameNode;
  late FocusNode passwordNode;
  String dropDownValue = "";
  bool dropDownValueError = true;
  @override
  void initState() {
    userNameNode = FocusNode();
    passwordNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userCreateInfo = 'Kullanıcı Bilgilerini Doldurunuz';
    double gap = 20;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Ionicons.create),
          )
        ],
        title: Text(
          'Kullanıcı Oluştur',
          style: context.textTheme.headline6,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userCreateInfo,
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(
                height: gap,
              ),
              TextFormField(
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(userNameNode);
                },
                decoration: const InputDecoration(
                    labelText: "Ad Soyad",
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: gap,
              ),
              TextFormField(
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordNode);
                },
                focusNode: userNameNode,
                decoration: const InputDecoration(
                    labelText: "Kullanıcı Adı",
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: gap,
              ),
              TextFormField(
                focusNode: passwordNode,
                decoration: const InputDecoration(
                    labelText: "Şifre",
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: gap,
              ),
              SelectFormField(
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
                    'value': 0,
                    'label': "Kullanıcı",
                  },
                  {
                    'value': 1,
                    'label': "Admin",
                  },
                ],
                type: SelectFormFieldType.dropdown,
              ),
              SizedBox(
                height: gap,
              ),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Kaydet",
                      style: context.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
