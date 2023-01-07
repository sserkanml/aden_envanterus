import 'package:aden/feature/projects/view/create_project.dart';
import 'package:aden/feature/projects/view/project_detail.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateProjectModule extends Module {
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const CreateProject(),
        ),
        ChildRoute(
          "/project-detail",
          child: (context, args) =>  ProjectDetail(project: args.data),
        )
      ];
}
