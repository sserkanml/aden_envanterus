import 'package:aden/feature/checks/controller/check_service.dart';
import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/item/controller/item_service.dart';
import 'package:aden/feature/projects/controller/projects_service.dart';
import 'package:aden/feature/root/model/tabs_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kartal/kartal.dart';
import 'package:tab_container/tab_container.dart';

import '../controller/page_navigation.dart';
import '../model/tabs.dart';

class TabContainerWidget extends StatefulWidget {
  final TabContainerController controller;

  const TabContainerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: Observer(
          builder: (context) {
            return TabContainer(
              tabs: [
                ...List.generate(
                  tabs.length,
                  (index) {
                    return Icon(tabs[index].icon,
                        size: 20,
                        color: widget.controller.index == index
                            ? context.colorScheme.onPrimary
                            : context.colorScheme.onBackground);
                  },
                )
              ],
              transitionBuilder: (child, animation) {
                animation =
                    CurvedAnimation(curve: Curves.easeIn, parent: animation);
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(.2, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              controller: widget.controller,
              radius: 7,
              isStringTabs: false,
              tabEdge: TabEdge.left,
              tabDuration: const Duration(milliseconds: 500),
              colors: <Color>[
                ...List.generate(
                    tabsColor.length, (index) => Color(tabsColor[index].color))
              ],
              children: [
                ...List.generate(
                    tabsColor.length,
                    (index) => Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      Modular.get<PageNavigation>()
                                          .changePage(tabsColor[index].id ?? 0);

                                      Modular.to
                                          .navigate(tabsColor[index].path);
                                    },
                                    child: Text(
                                      "Detay",
                                      style: context.textTheme.bodyLarge!
                                          .copyWith(
                                              color: Color(
                                                  tabsColor[index].color)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              index == 0
                                  ? Modular.get<ProjectService>()
                                      .getProjectLength
                                      .toString()
                                  : (index == 1
                                      ? Modular.get<CustomerService>()
                                          .getLength
                                          .toString()
                                      : (index == 2
                                          ? Modular.get<CheckService>()
                                              .getAllCheckLength
                                              .toString()
                                          : Modular.get<ItemService>()
                                              .getItemLength
                                              .toString())),
                              style: context.textTheme.headline4!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              tabsColor[index].label,
                              style: context.textTheme.headline6!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ))
              ],
            );
          },
        ));
  }
}
