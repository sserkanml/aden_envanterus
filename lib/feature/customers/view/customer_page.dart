import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../settings/controller/user_service.dart';
import '../model/customer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late List<Customer> filterList;
  @override
  void initState() {
    filterList = Modular.get<CustomerService>().customers;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "create-customer",
          backgroundColor: context.colorScheme.primary,
          onPressed: () async {
            await Modular.to.pushNamed("/create-customer");
            setState(() {});
          },
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 19.0),
              child: Icon(
                FontAwesomeIcons.users,
                size: 22,
              ),
            )
          ],
          title: Text(
            'Müşteriler',
            style: context.textTheme.headline6!.copyWith(),
          ),
        ),
        body: SafeArea(
          child: Modular.get<CustomerService>().isCorrectLoad
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SearchableList.seperated(
                    initialList: filterList,
                    textInputType: TextInputType.text,
                    searchTextPosition: SearchTextPosition.top,
                    inputDecoration: const InputDecoration(
                        suffixIcon: null,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 8.0,
                        ),
                        labelText: "Kullanıcılar",
                        hintText: "Arama Yap"),
                    emptyWidget: const Text("Bir kayıt bulunamadı"),
                    filter: (p0) => filterList
                        .where((element) =>
                            (element.musteriFirmaAdi!
                                .toLowerCase()
                                .contains(p0.toLowerCase())) ||
                            (element.musteriYetkili!
                                .toLowerCase()
                                .contains(p0.toLowerCase())))
                        .toList(),
                    builder: (p0) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8.0,
                        ),
                        onTap: () async {
                          Modular.to.pushNamed("/create-customer/customer-detail"
                          ,arguments: p0);
                          setState(() {});
                        },
                        trailing: p0.aktifPasif == 0
                            ? TextButton(
                                onPressed: null,
                                child: Text(
                                  "Pasif",
                                  style: context.textTheme.bodyMedium!.copyWith(
                                      color: context.colorScheme.onSurface
                                          .withOpacity(.3),
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Aktif",
                                  style: context.textTheme.bodyMedium!.copyWith(
                                      color: context.colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                        subtitle: Text(
                          p0.musteriYetkili ?? "",
                          style: context.textTheme.bodySmall!.copyWith(
                              color:
                                  context.colorScheme.onSurface.withOpacity(.4),
                              fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          p0.musteriFirmaAdi ?? "hello",
                          style: context.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    seperatorBuilder: (p0, p1) {
                      return Divider(
                        height: 1,
                        color: context.colorScheme.onSurface.withOpacity(.1),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text('Kayıtlı Kullanıcı Bulunamadı'),
                ),
        ));
  }
}
