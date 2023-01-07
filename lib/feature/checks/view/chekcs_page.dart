import 'package:aden/feature/checks/controller/check_service.dart';
import 'package:aden/feature/checks/model/check_info_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';

class ChekcsPage extends StatefulWidget {
  const ChekcsPage({Key? key}) : super(key: key);

  @override
  State<ChekcsPage> createState() => _ChekcsPageState();
}

class _ChekcsPageState extends State<ChekcsPage> {
  double gap = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.colorScheme.primary,
        heroTag: "create-check",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: SearchPage<>(builder: builder, filter: filter, items: items));
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            checkListView(context),
            SizedBox(
              height: gap,
            ),
            ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    subtitle: Text(Modular.get<CheckService>()
                        .showCheck[index]
                        .companyName),
                    title: Row(
                      children: [
                        Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Modular.get<CheckService>()
                                            .checkDetails[index]
                                            .onayDurum ==
                                        0
                                    ? Colors.red
                                    : (Modular.get<CheckService>()
                                                .checkDetails[index]
                                                .onayDurum ==
                                            1
                                        ? Colors.green
                                        : Colors.yellow))),
                        const SizedBox(width: 10),
                        Text(Modular.get<CheckService>()
                            .showCheck[index]
                            .itemName),
                      ],
                    ),
                    trailing: Text(Modular.get<CheckService>()
                        .checks[index]
                        .miktar!
                        .toInt()
                        .toString()),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: context.colorScheme.onSurface.withOpacity(.3),
                  );
                },
                itemCount: Modular.get<CheckService>().getAllCheckLength)
          ],
        ),
      )),
    );
  }

  Observer checkListView(BuildContext context) {
    return Observer(builder: (_) {
      return SizedBox(
        height: 60,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(
              Modular.get<CheckInfoService>().checkInfo.length,
              (index) => TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Modular.get<CheckInfoService>()
                          .checkInfo[index]
                          .color),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          Modular.get<CheckInfoService>()
                              .checkInfo[index]
                              .label,
                          style: context.textTheme.bodyLarge!.copyWith(
                              color: Modular.get<CheckInfoService>()
                                  .checkInfo[index]
                                  .color),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Modular.get<CheckInfoService>()
                              .checkInfo[index]
                              .quantity
                              .toString(),
                          style: context.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
    });
  }
}
