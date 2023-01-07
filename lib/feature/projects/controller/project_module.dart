import 'package:aden/feature/projects/view/create_project.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateProjectModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const CreateProject(),
        )
      ];
}
