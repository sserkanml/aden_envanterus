import 'package:aden/feature/root/model/bottom_item.dart';
import 'package:aden/feature/root/widget/bottom_item_wigdet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int idPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: Container(
        width: context.dynamicWidth(1),
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: context.colorScheme.onSurface.withOpacity(.08))
            ],
            color: context.colorScheme.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7), topRight: Radius.circular(14))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...List.generate(
              bottomData.length,
              (index) {
                return Expanded(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          idPage = index;
                          Modular.to.pushNamed(bottomData[index].path);
                        });
                      },
                      child: BottomItemWigdet(
                          label: bottomData[index].label,
                          path: bottomData[index].path,
                          icon: bottomData[index].icon,
                          color: idPage == index
                              ? context.colorScheme.primary
                              : context.colorScheme.onSurface.withOpacity(.2)),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
