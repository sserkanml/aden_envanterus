import 'package:aden/feature/checks/controller/check_service.dart';
import 'package:aden/feature/customers/model/customer.dart';
import 'package:aden/feature/item/controller/item_service.dart';
import 'package:aden/feature/item/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:kartal/kartal.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../checks/model/check.dart';

class CustomerDetailPage extends StatefulWidget {
  final Customer customer;
  const CustomerDetailPage({Key? key, required this.customer})
      : super(key: key);

  @override
  _CustomerDetailPageState createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  late TextEditingController companyNameController;
  late TextEditingController phoneController;
  late TextEditingController authorityController;
  late TextEditingController emailController;
  late TextEditingController taxPlaceController;
  late TextEditingController taxNoController;
  late TextEditingController adressController;
  late FocusNode companyNameFocus;
  late FocusNode phoneFocus;
  late FocusNode authorityFocus;
  late FocusNode emailFocus;
  late FocusNode taxPlaceFocus;
  late FocusNode taxNoFocus;
  late FocusNode adressFocus;
  late List<ItemModel> items;
  late String dropDownValue;
  late List<Check> checks;
  late PhoneNumber customerPhoneNumber;
  @override
  void initState() {
    companyNameFocus = FocusNode();
    phoneFocus = FocusNode();
    emailFocus = FocusNode();
    authorityFocus = FocusNode();
    taxPlaceFocus = FocusNode();
    taxNoFocus = FocusNode();
    adressFocus = FocusNode();

    companyNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    authorityController = TextEditingController();
    taxPlaceController = TextEditingController();
    taxNoController = TextEditingController();
    adressController = TextEditingController();

    companyNameController.text = widget.customer.musteriFirmaAdi ?? "";
    phoneController.text = widget.customer.musteriTelefon ?? "";
    emailController.text = widget.customer.musteriEmail ?? "";
    authorityController.text = widget.customer.musteriYetkili ?? "";
    taxPlaceController.text = widget.customer.musteriVergiDaire ?? "";
    taxNoController.text = widget.customer.musteriVergiNo ?? "";
    adressController.text = widget.customer.musteriAdres ?? "";

    customerPhoneNumber = PhoneNumber(
        isoCode: IsoCode.TR, nsn: widget.customer.musteriTelefon ?? "");

    checks = Modular.get<CheckService>()
        .checks
        .where((check) => (check.sayim ==
            Modular.get<CheckService>()
                .checkDetails
                .firstWhereOrNull((checkdetail) =>
                    checkdetail.musteriID == widget.customer.oid)
                ?.oid))
        .toList();

    items = Modular.get<ItemService>()
        .items
        .where((element) => element.musteriID == widget.customer.oid)
        .toList();

    dropDownValue = widget.customer.aktifPasif == 0 ? "Pasif" : "Aktif";

    super.initState();
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
        actions: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: context.dynamicHeight(.3),
                    child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: <Widget>[
                            TabBar(
                                labelPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 8.0,
                                ),
                                padding: const EdgeInsets.all(12.0),
                                indicatorPadding:
                                    const EdgeInsets.only(top: 10),
                                indicatorWeight: 2,
                                tabs: [
                                  Text(
                                    'Malzemeler',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'Sayımlar',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                ]),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TabBarView(
                                  children: [itemsCustomer(), checkCustomer()]),
                            ))
                          ],
                        )),
                  );
                },
              );
            },
            child: const Text(
              "Bilgi",
            ),
          )
        ],
        title: Text(
          'Müşteri Detayı',
          style: context.textTheme.headline6,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            companyNameField(context),
            SizedBox(height: gap),
            authoriyField(context),
            SizedBox(height: gap),
            emailField(context),
            SizedBox(height: gap),
            taxPlaceField(context),
            SizedBox(height: gap),
            taxNoField(context),
            SizedBox(height: gap),
            adressField(context),
            SizedBox(height: gap),
            PhoneFormField(
              autocorrect: true,
              initialValue: customerPhoneNumber,
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
                    "Düzenle",
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

  TextFormField companyNameField(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(authorityFocus);
      },
      focusNode: companyNameFocus,
      keyboardType: TextInputType.text,
      controller: companyNameController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          hintText: "Şirket Adı",
          alignLabelWithHint: true,
          labelText: "Şirket Adı"),
    );
  }

  TextFormField authoriyField(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(emailFocus);
      },
      focusNode: authorityFocus,
      keyboardType: TextInputType.text,
      controller: authorityController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          hintText: "Yetkili",
          alignLabelWithHint: true,
          labelText: "Yetkili"),
    );
  }

  TextFormField emailField(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(taxPlaceFocus);
      },
      focusNode: emailFocus,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          hintText: "Email",
          alignLabelWithHint: true,
          labelText: "Email"),
    );
  }

  TextFormField taxPlaceField(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(taxNoFocus);
      },
      focusNode: taxPlaceFocus,
      keyboardType: TextInputType.text,
      controller: taxPlaceController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          hintText: "Vergi Dairesi",
          alignLabelWithHint: true,
          labelText: "Vergi Dairesi"),
    );
  }

  TextFormField taxNoField(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(adressFocus);
      },
      focusNode: taxNoFocus,
      keyboardType: TextInputType.number,
      controller: taxNoController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          hintText: "Vergi No",
          alignLabelWithHint: true,
          labelText: "Vergi No"),
    );
  }

  TextFormField adressField(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      focusNode: adressFocus,
      keyboardType: TextInputType.text,
      maxLines: 6,
      controller: adressController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          hintText: "Adres ",
          alignLabelWithHint: true,
          labelText: "Adres"),
    );
  }

  Widget checkCustomer() {
    return checks.isNullOrEmpty
        ? Center(
            child: Text(
              'Sayım Bulunamadı',
              style: context.textTheme.bodyMedium,
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                title: Text(Modular.get<ItemService>()
                        .items
                        .where(
                            (element) => element.oid == checks[index].malzeme)
                        .first
                        .adi ??
                    ""),
                trailing: Text(checks[index].miktar.toString()),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0,
                color: context.colorScheme.onSurface.withOpacity(.3),
              );
            },
            itemCount: checks.length);
  }

  Widget itemsCustomer() {
    return items.isNullOrEmpty
        ? Center(
            child: Text(
              'Ürün Bulunamadı',
              style: context.textTheme.bodyMedium,
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: () {},
                  trailing: Text(items[index].birim ?? ""),
                  title: Text(
                    items[index].adi ?? "",
                    style: context.textTheme.bodyMedium,
                  ));
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0,
                color: context.colorScheme.onSurface.withOpacity(.3),
              );
            },
            itemCount: items.length);
  }
}
