import 'dart:convert';
import 'dart:io';

import 'package:aden/core/constant/service_constant.dart';
import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:aden/feature/projects/model/project.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'projects_service.g.dart';

class ProjectService = _ProjectServiceBase with _$ProjectService;

abstract class _ProjectServiceBase with Store {
  @observable
  ObservableList<Project> projects = ObservableList<Project>();

  @observable
  bool isCorrectLoad = false;

  @computed
  int get getProjectLength => projects.length;

  @action
  Future<void> getAllProject() async {
    final url = Uri.http(Modular.get<ServiceConstant>().baseUrl,
        Modular.get<ServiceConstant>().getProject);

    try {
      final response = await http.get(url,
          headers: {"cookie": Modular.get<UserSession>().userSession});
      if (response.statusCode == HttpStatus.ok) {
        final result = jsonDecode(response.body);
        final projectApi = result["jsonData_2"];
        if (projectApi is List) {
          projects = ObservableList.of(
              projectApi.map<Project>((e) => Project.fromMap(e)).toList());
          isCorrectLoad = true;
        } else {
          isCorrectLoad = false;
        }
      } else {
        isCorrectLoad = false;
      }
    } catch (e) {
      print(e);
      isCorrectLoad = false;
    }
  }
}
