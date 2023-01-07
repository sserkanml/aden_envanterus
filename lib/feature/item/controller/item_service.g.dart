// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemService on _ItemServiceBase, Store {
  Computed<int>? _$getItemLengthComputed;

  @override
  int get getItemLength =>
      (_$getItemLengthComputed ??= Computed<int>(() => super.getItemLength,
              name: '_ItemServiceBase.getItemLength'))
          .value;

  late final _$itemsAtom =
      Atom(name: '_ItemServiceBase.items', context: context);

  @override
  ObservableList<ItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isCorrectLoadAtom =
      Atom(name: '_ItemServiceBase.isCorrectLoad', context: context);

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

  late final _$getAllItemAsyncAction =
      AsyncAction('_ItemServiceBase.getAllItem', context: context);

  @override
  Future<void> getAllItem() {
    return _$getAllItemAsyncAction.run(() => super.getAllItem());
  }

  @override
  String toString() {
    return '''
items: ${items},
isCorrectLoad: ${isCorrectLoad},
getItemLength: ${getItemLength}
    ''';
  }
}
