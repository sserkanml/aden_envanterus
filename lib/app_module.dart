import 'package:aden/core/logic/date_time.dart';
import 'package:aden/feature/authentication/controller/auth_mobx.dart';
import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/item/controller/item_service.dart';
import 'package:aden/feature/projects/controller/project_module.dart';
import 'package:aden/feature/projects/controller/projects_service.dart';
import 'package:aden/feature/root/controller/page_navigation.dart';
import 'package:aden/feature/root/controller/root_module.dart';
import 'package:aden/feature/settings/controller/setting_module.dart';
import 'package:aden/feature/settings/controller/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/pref_key.dart';
import 'core/constant/service_constant.dart';
import 'core/service/cache_service.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'feature/authentication/controller/auth_module.dart';

class AppModule extends Module {
  final SharedPreferences pref;

  AppModule({required this.pref});
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<DarkTheme>((i) => DarkTheme()),
        Bind.lazySingleton<LightTheme>((i) => LightTheme()),
        Bind.lazySingleton<AuthMobx>((i) => AuthMobx()),
        Bind.lazySingleton<UserSession>((i) => UserSession()),
        Bind.lazySingleton<ServiceConstant>((i) => ServiceConstant()),
        Bind.lazySingleton<ConstantPrefKey>((i) => ConstantPrefKey()),
        Bind.lazySingleton<PageNavigation>((i) => PageNavigation()),
        Bind.lazySingleton<ItemService>((i) => ItemService()),
        Bind.lazySingleton<MemberService>((i) => MemberService()),
        Bind.lazySingleton<CustomerService>((i) => CustomerService()),
        Bind.lazySingleton<ProjectService>((i) => ProjectService()),
        Bind.lazySingleton<DateTimeLogic>((i) => DateTimeLogic()),
        Bind.lazySingleton<CacheService>((i) => CacheService(pref)),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: RootModule()),
        ModuleRoute("/authentication",
            transition: TransitionType.noTransition, module: AuhtModule()),
        ModuleRoute("/create-project", module: CreateProjectModule()),
        ModuleRoute("/setting-detail-user",
            transition: TransitionType.rightToLeft, module: SettingModule()),
      ];
}
