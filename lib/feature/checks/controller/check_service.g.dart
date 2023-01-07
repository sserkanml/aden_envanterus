// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckService on _CheckServiceBase, Store {
  Computed<int>? _$getPendingCheckComputed;

  @override
  int get getPendingCheck =>
      (_$getPendingCheckComputed ??= Computed<int>(() => super.getPendingCheck,
              name: '_CheckServiceBase.getPendingCheck'))
          .value;
  Computed<int>? _$getAllCheckLengthComputed;

  @override
  int get getAllCheckLength => (_$getAllCheckLengthComputed ??= Computed<int>(
          () => super.getAllCheckLength,
          name: '_CheckServiceBase.getAllCheckLength'))
      .value;
  Computed<int>? _$getCancelCheckComputed;

  @override
  int get getCancelCheck =>
      (_$getCancelCheckComputed ??= Computed<int>(() => super.getCancelCheck,
              name: '_CheckServiceBase.getCancelCheck'))
          .value;
  Computed<int>? _$getConfirmedCheckComputed;

  @override
  int get getConfirmedCheck => (_$getConfirmedCheckComputed ??= Computed<int>(
          () => super.getConfirmedCheck,
          name: '_CheckServiceBase.getConfirmedCheck'))
      .value;

  late final _$checksAtom =
      Atom(name: '_CheckServiceBase.checks', context: context);

  @override
  ObservableList<Check> get checks {
    _$checksAtom.reportRead();
    return super.checks;
  }

  @override
  set checks(ObservableList<Check> value) {
    _$checksAtom.reportWrite(value, super.checks, () {
      super.checks = value;
    });
  }

  late final _$checkDetailsAtom =
      Atom(name: '_CheckServiceBase.checkDetails', context: context);

  @override
  ObservableList<CheckDetail> get checkDetails {
    _$checkDetailsAtom.reportRead();
    return super.checkDetails;
  }

  @override
  set checkDetails(ObservableList<CheckDetail> value) {
    _$checkDetailsAtom.reportWrite(value, super.checkDetails, () {
      super.checkDetails = value;
    });
  }

  late final _$isCorrectLoadAtom =
      Atom(name: '_CheckServiceBase.isCorrectLoad', context: context);

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

  late final _$getAllCheckAsyncAction =
      AsyncAction('_CheckServiceBase.getAllCheck', context: context);

  @override
  Future<void> getAllCheck() {
    return _$getAllCheckAsyncAction.run(() => super.getAllCheck());
  }

  late final _$_CheckServiceBaseActionController =
      ActionController(name: '_CheckServiceBase', context: context);

  @override
  void getShowCheck() {
    final _$actionInfo = _$_CheckServiceBaseActionController.startAction(
        name: '_CheckServiceBase.getShowCheck');
    try {
      return super.getShowCheck();
    } finally {
      _$_CheckServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checks: ${checks},
checkDetails: ${checkDetails},
isCorrectLoad: ${isCorrectLoad},
getPendingCheck: ${getPendingCheck},
getAllCheckLength: ${getAllCheckLength},
getCancelCheck: ${getCancelCheck},
getConfirmedCheck: ${getConfirmedCheck}
    ''';
  }
}
