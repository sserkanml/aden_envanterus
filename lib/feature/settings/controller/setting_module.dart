import 'package:aden/feature/settings/view/user_detail.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../view/alerts_page.dart';
import '../view/create_user.dart';
import '../view/my_info_page.dart';
import '../view/system_settings_page.dart';
import '../view/users_page.dart';

class SettingModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const UsersPage(),
        ),
        ChildRoute(
          "/system-setting",
          child: (context, args) => const SystemSettingsPage(),
        ),
         ChildRoute(
          "/user-detail",
          child: (context, args) =>  UserDetail(member: args.data,),
        ),
        ChildRoute(
          "/create-user",
          child: (context, args) => const CreateUser(),
        ),
        ChildRoute(
          "/my-info",
          child: (context, args) => const MyInfoPage(),
        ),
        ChildRoute(
          "/alerts",
          child: (context, args) => const AlertsPage(),
        ),
      ];
}
