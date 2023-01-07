import 'package:aden/core/logic/date_time.dart';
import 'package:aden/feature/projects/controller/projects_service.dart';
import 'package:aden/feature/projects/model/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:line_icons/line_icons.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late List<Project> filterList;
  @override
  void initState() {
    filterList = Modular.get<ProjectService>().projects;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "add-project",
          backgroundColor: context.colorScheme.primary,
          onPressed: () {
            Modular.to.pushNamed("/create-project");
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                LineIcons.projectDiagram,
                size: 25,
              ),
            )
          ],
          title: Text(
            'Projeler',
            style: context.textTheme.headline6!.copyWith(),
          ),
        ),
        body: SafeArea(
          child: Modular.get<ProjectService>().isCorrectLoad
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
                            (element.projeAdi!
                                .toLowerCase()
                                .contains(p0.toLowerCase())) ||
                            (element.kaydeden!
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
                          Modular.to.pushNamed("/create-project/project-detail",
                              arguments: p0);
                          setState(() {});
                        },
                        trailing: Text(Modular.get<DateTimeLogic>()
                            .convertDateTime(Modular.get<DateTimeLogic>()
                                .getJsonData(p0.kayitZamani!))),
                        subtitle: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.user,
                              size: 10,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              p0.kaydeden ?? "",
                              style: context.textTheme.bodySmall!.copyWith(
                                  color: context.colorScheme.onSurface
                                      .withOpacity(.4),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        title: Text(
                          p0.projeAdi ?? "hello",
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
