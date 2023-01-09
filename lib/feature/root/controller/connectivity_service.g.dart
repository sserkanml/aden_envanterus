// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityService on _ConnectivityServiceBase, Store {
  late final _$connectivityStreamAtom = Atom(
      name: '_ConnectivityServiceBase.connectivityStream', context: context);

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

  late final _$isFirstConnectedAtom =
      Atom(name: '_ConnectivityServiceBase.isFirstConnected', context: context);

  @override
  bool get isFirstConnected {
    _$isFirstConnectedAtom.reportRead();
    return super.isFirstConnected;
  }

  @override
  set isFirstConnected(bool value) {
    _$isFirstConnectedAtom.reportWrite(value, super.isFirstConnected, () {
      super.isFirstConnected = value;
    });
  }

  late final _$getConnectivityAsyncAction =
      AsyncAction('_ConnectivityServiceBase.getConnectivity', context: context);

  @override
  Future<void> getConnectivity() {
    return _$getConnectivityAsyncAction.run(() => super.getConnectivity());
  }

  late final _$_ConnectivityServiceBaseActionController =
      ActionController(name: '_ConnectivityServiceBase', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$_ConnectivityServiceBaseActionController.startAction(
        name: '_ConnectivityServiceBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ConnectivityServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityStream: ${connectivityStream},
isFirstConnected: ${isFirstConnected}
    ''';
  }
}
