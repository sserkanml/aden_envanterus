import 'package:aden/feature/settings/controller/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:searchable_listview/resources/arrays.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../model/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late List<Member> filterList;
  @override
  void initState() {
    filterList = Modular.get<MemberService>().members;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(FontAwesomeIcons.users),
            )
          ],
          title: Text(
            'Kullanıcılar',
            style: context.textTheme.headline6,
          ),
        ),
        body: SafeArea(
            child: Modular.get<MemberService>().isCorrectLoad
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
                            vertical: 8.0,
                            horizontal: 8.0,
                          ),
                          labelText: "Kullanıcılar",
                          hintText: "Arama Yap"),
                      emptyWidget: const Text("Bir kayıt bulunamadı"),
                      filter: (p0) => filterList
                          .where((element) =>
                              (element.adiSoyadi!
                                  .toLowerCase()
                                  .contains(p0.toLowerCase())) ||
                              (element.kullaniciAdi!
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
                           await Modular.to.pushNamed("/setting-detail-user/user-detail",arguments: p0);
                           setState(() {
                             
                           });
                          },
                          trailing: p0.aktifPasif == 0
                              ? TextButton(
                                  onPressed: null,
                                  child: Text(
                                    "Pasif",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(
                                            color: context.colorScheme.onSurface
                                                .withOpacity(.3),
                                            fontWeight: FontWeight.bold),
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Aktif",
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(
                                            color: context.colorScheme.primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                          subtitle: Text(
                            p0.kullaniciAdi ?? "",
                            style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(.4),
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            p0.adiSoyadi ?? "hello",
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
                  )));
  }
}
