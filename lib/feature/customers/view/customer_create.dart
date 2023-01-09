import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:select_form_field/select_form_field.dart';

class CustomerCreatePage extends StatefulWidget {
  const CustomerCreatePage({Key? key}) : super(key: key);

  @override
  State<CustomerCreatePage> createState() => _CustomerCreatePageState();
}

class _CustomerCreatePageState extends State<CustomerCreatePage> {
  double gap = 20;
  late String dropDownValue;

  @override
  void initState() {
    dropDownValue = "";
    super.initState();
  }

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
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Şirket İsmi",
                  alignLabelWithHint: true,
                  labelText: "Şirket İsmi"),
            ),
            SizedBox(height: gap),
            TextFormField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Yetkili İsmi",
                  alignLabelWithHint: true,
                  labelText: "Yetkili İsmi"),
            ),
            SizedBox(height: gap),
            TextFormField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Vergi Dairesi",
                  alignLabelWithHint: true,
                  labelText: "Vergi Dairesi"),
            ),
            SizedBox(height: gap),
            TextFormField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Vergi No",
                  alignLabelWithHint: true,
                  labelText: "Vergi No"),
            ),
            SizedBox(height: gap),
            PhoneFormField(
              autocorrect: true,
              isCountrySelectionEnabled: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              defaultCountry: IsoCode.TR,
              validator: (phoneNumber) {
                if (phoneNumber?.isValid() ?? false) {
                  return null;
                } else {
                  return "Geçerli telefon numarası giriniz";
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                labelText: "Telefon Numarası",
                hintText: "Telefon Numarası",
              ),
            ),
            SizedBox(height: gap),
            TextFormField(
              maxLines: 7,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Not Yaz",
                  alignLabelWithHint: true,
                  labelText: "Not"),
            ),
            SizedBox(height: gap),
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
                  'value': "Aktif",
                  'label': "Aktif",
                },
                {
                  'value': "Pasif",
                  'label': "Pasif",
                },
              ],
              type: SelectFormFieldType.dropdown,
            ),
            SizedBox(height: gap),
            Row(
              children: <Widget>[
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
        )),
      )),
    );
  }
}
