import 'dart:io';

import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/settings/controller/user_service.dart';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_input_chips/flutter_input_chips.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kartal/kartal.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  late FocusNode userNameFocus;
  late SingleValueDropDownController customerDropDown;
  late SingleValueDropDownController userDropDown;
  List<String> tags = [];
  @override
  void initState() {
    customerDropDown = SingleValueDropDownController();
    userDropDown = SingleValueDropDownController();

    super.initState();
  }

  @override
  void dispose() {
    customerDropDown.dispose();
    userDropDown.dispose();
    super.dispose();
  }

  

  

  double gap = 20;
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
            'Proje Oluştur',
            style: context.textTheme.headline6,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fotoğraf Ekle',
                      style: context.textTheme.bodyLarge,
                    ),
                    GFIconButton(
                      icon: const Icon(FontAwesomeIcons.camera),
                      onPressed: ()  {
                  
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: gap,
                ),
                TextFormField(
                  onFieldSubmitted: (value) {},
                  decoration: const InputDecoration(
                      labelText: "Proje Adı",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0,
                      ),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: gap,
                ),
                dropdownCustomer(),
                SizedBox(
                  height: gap,
                ),
                dropDownMember(),
                SizedBox(
                  height: gap,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Not Yaz",
                      alignLabelWithHint: true,
                      labelText: "Not"),
                ),
                SizedBox(
                  height: gap,
                ),
                FlutterInputChips(
                  maxChips: 4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  chipBackgroundColor: context.colorScheme.primary,
                  chipSpacing: 10,
                  initialValue: const [],
                  chipDeleteIcon: const Icon(Icons.close),
                  chipDeleteIconColor: Colors.white,
                  chipTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  inputDecoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Etiket",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0,
                      )),
                  onChanged: (value) {
                    setState(() {
                      tags = value;
                    });
                  },
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
        )));
  }

  DropDownTextField dropDownMember() {
    return DropDownTextField(
        textFieldDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            hintText: "Kullanıcı Seç",
            labelText: "Kullanıcı Seç"),
        validator: (value) {
          if (value == null) {
            return "Bu alan boş geçilemez";
          } else {
            return null;
          }
        },
        onChanged: (value) {},
        dropDownList: [
          ...List.generate(
              Modular.get<CustomerService>().getLength,
              (index) => DropDownValueModel(
                  name: Modular.get<MemberService>().members[index].adiSoyadi ??
                      " ",
                  value: Modular.get<MemberService>().members[index].oid))
        ],
        dropDownItemCount: Modular.get<MemberService>().getLength);
  }

  DropDownTextField dropdownCustomer() {
    return DropDownTextField(
        controller: customerDropDown,
        textFieldDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            hintText: "Müşteri Seç",
            labelText: "Müşteri Seç"),
        validator: (value) {
          if (value == null) {
            return "Bu alan boş geçilemez";
          } else {
            return null;
          }
        },
        onChanged: (value) {},
        dropDownList: [
          ...List.generate(
              Modular.get<CustomerService>().getLength,
              (index) => DropDownValueModel(
                  name: Modular.get<CustomerService>()
                          .customers[index]
                          .musteriFirmaAdi ??
                      " ",
                  value: Modular.get<CustomerService>().customers[index].oid))
        ],
        dropDownItemCount: Modular.get<CustomerService>().getLength);
  }
}

class ChristianPickerImage {
  static const MethodChannel _channel = MethodChannel('christian_picker_image');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<List<File>> pickImages({
    required int maxImages,
    enableGestures = true,
  }) async {
    final List<dynamic> images = await _channel.invokeMethod(
        'pickImages', <String, dynamic>{
      "maxImages": maxImages,
      "enableGestures": enableGestures
    });

    return images.map((f) {
      return File(f["path"]);
    }).toList();
  }
}
