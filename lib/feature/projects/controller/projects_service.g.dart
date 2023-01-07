// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectService on _ProjectServiceBase, Store {
  late final _$projectsAtom =
      Atom(name: '_ProjectServiceBase.projects', context: context);

  @override
  ObservableList<Project> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(ObservableList<Project> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  late final _$isCorrectLoadAtom =
      Atom(name: '_ProjectServiceBase.isCorrectLoad', context: context);

  @override
  bool get isCorrectLoad {
    _$isCorrectLoadAtom.reportRead();
    return super.isCorrectLoad;
  }

  @override
  set isCorrectLoad(bool value) {
    _$isCorrectLoadAtom.reportWrite(value, super.isCorrectLoad, () {
      super.isCorrectLoad = value;
    });
  }

  late final _$getAllProjectAsyncAction =
      AsyncAction('_ProjectServiceBase.getAllProject', context: context);

  @override
  Future<void> getAllProject() {
    return _$getAllProjectAsyncAction.run(() => super.getAllProject());
  }

  @override
  String toString() {
    return '''
projects: ${projects},
isCorrectLoad: ${isCorrectLoad}
    ''';
  }
}
