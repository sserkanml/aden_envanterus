import 'package:aden/core/logic/date_time.dart';
import 'package:aden/feature/checks/controller/check_service.dart';
import 'package:aden/feature/checks/model/show_checks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:search_page/search_page.dart';

class ChekcsPage extends StatefulWidget {
  const ChekcsPage({Key? key}) : super(key: key);

  @override
  State<ChekcsPage> createState() => _ChekcsPageState();
}

class _ChekcsPageState extends State<ChekcsPage> {
  double gap = 20;
  final bool _showFab = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: context.dynamicHeight(.1),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 50,
                        width: context.dynamicWidth(1),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Sayım Oluştur",
                            style: context.textTheme.headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            backgroundColor: context.colorScheme.primary,
            heroTag: "create-check",
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchPage<ShowCheck>(
                      suggestion: const Center(
                        child: Text('Arama Yapabilirsiniz'),
                      ),
                      searchLabel: "Arama Yapın...",
                      failure: const Center(
                        child: Text('Sayım Bulunamadı :('),
                      ),
                      builder: (t) {
                        return searchCard(context, t);
                      },
                      filter: (t) {
                        return <String>[
                          t.companyName,
                          t.itemName,
                          t.quantity.toString()
                        ];
                      },
                      items: Modular.get<CheckService>().showCheck));
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ],
        title: Text(
          'Sayımlar',
          style: context.textTheme.headline6!.copyWith(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            topSide(context),
            SizedBox(
              height: gap,
            ),
            checkListView()
          ],
        ),
      )),
    );
  }

  ListView checkListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 130,
          width: context.dynamicWidth(1),
          child: InkWell(
            onTap: () {},
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 90,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Modular.get<CheckService>()
                                  .showCheck[index]
                                  .companyName,
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: context.colorScheme.onSurface
                                      .withOpacity(.56)),
                            ),
                            const SizedBox(height: 5),
                            Text(
                                Modular.get<CheckService>()
                                    .showCheck[index]
                                    .itemName,
                                style: context.textTheme.bodyMedium!),
                            const SizedBox(height: 10),
                            quantityPrice(index, context),
                            const SizedBox(height: 10),
                            const Text('etiket')
                          ],
                        ),
                      ],
                    ),
                    Text(
                      Modular.get<DateTimeLogic>().convertDateTime(
                          Modular.get<DateTimeLogic>().getJsonData(
                              Modular.get<CheckService>()
                                  .showCheck[index]
                                  .dateSaved)),
                      style: context.textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: Modular.get<CheckService>().getAllCheckLength,
    );
  }

  SizedBox searchCard(BuildContext context, ShowCheck t) {
    return SizedBox(
      height: 150,
      width: context.dynamicWidth(1),
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 90,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          t.companyName,
                          style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.onSurface
                                  .withOpacity(.56)),
                        ),
                        const SizedBox(height: 5),
                        Text(t.itemName, style: context.textTheme.bodyMedium!),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.layers,
                                  size: 14,
                                ),
                                const SizedBox(width: 5),
                                Text("${t.quantity.toInt()} ${t.unitName}")
                              ],
                            ),
                            const SizedBox(width: 5),
                            Text('|',
                                style: context.textTheme.bodyMedium!.copyWith(
                                    color: context.colorScheme.onSurface
                                        .withOpacity(.4))),
                            const SizedBox(width: 5),
                            Text(
                              '₺640k',
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text('etiket')
                      ],
                    ),
                  ],
                ),
                Text(
                  Modular.get<DateTimeLogic>().convertDateTime(
                      Modular.get<DateTimeLogic>().getJsonData(t.dateSaved)),
                  style: context.textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row quantityPrice(int index, BuildContext context) {
    return Row(
      children: [
        quantitySide(index),
        const SizedBox(width: 5),
        Text('|',
            style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurface.withOpacity(.4))),
        const SizedBox(width: 5),
        Text(
          '₺640k',
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Row quantitySide(int index) {
    return Row(
      children: [
        const Icon(
          Icons.layers,
          size: 14,
        ),
        const SizedBox(width: 5),
        Text(
            "${Modular.get<CheckService>().showCheck[index].quantity.toInt()} ${Modular.get<CheckService>().showCheck[index].unitName}")
      ],
    );
  }

  Column topSide(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Toplam Malzeme Sayısı',
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '43',
                    style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(.4),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Toplam Proje Sayısı',
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '43',
                    style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(.4),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Toplam Malzeme Miktarı ',
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '3.200 birim',
                    style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(.4),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Toplam Envanter  Tutarı',
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '₺6.53k',
                    style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(.4),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
