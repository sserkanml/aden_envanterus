import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/item/controller/item_service.dart';
import 'package:aden/feature/item/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  late List<ItemModel> itemFilter;
  @override
  void initState() {
    itemFilter = Modular.get<ItemService>().items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Modular.to.pushNamed("/dashboard");
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            'Malzemeler',
            style: context.textTheme.headline6,
          ),
        ),
        body: SafeArea(
            child: Modular.get<ItemService>().isCorrectLoad
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SearchableList.seperated(
                      initialList: itemFilter,
                      textInputType: TextInputType.text,
                      searchTextPosition: SearchTextPosition.top,
                      inputDecoration: const InputDecoration(
                          suffixIcon: null,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0,
                          ),
                          labelText: "Kullanıcılar",
                          hintText: "Arama Yap"),
                      emptyWidget: const Text("Bir kayıt bulunamadı"),
                      filter: (p0) => itemFilter
                          .where((element) =>
                              (element.adi!
                                  .toLowerCase()
                                  .contains(p0.toLowerCase())) ||
                              Modular.get<CustomerService>().customers.any(
                                  (element) => element.musteriFirmaAdi!
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
                            await Modular.to
                                .pushNamed("/items/item-detail", arguments: p0);
                            setState(() {});
                          },
                          trailing: Text(
                            p0.birim ?? " ",
                            style: context.textTheme.bodyMedium!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.6)),
                          ),
                          subtitle: Text(
                            Modular.get<CustomerService>()
                                    .customers
                                    .firstWhereOrNull((element) =>
                                        element.oid == p0.musteriID)
                                    ?.musteriFirmaAdi ??
                                "Bulunamadı",
                            style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.4),
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            p0.adi ?? "hello",
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
                  )),
      ),
    );
  }
}
