// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerService on _CustomerServiceBase, Store {
  Computed<int>? _$getLengthComputed;

  @override
  int get getLength =>
      (_$getLengthComputed ??= Computed<int>(() => super.getLength,
              name: '_CustomerServiceBase.getLength'))
          .value;

  late final _$customersAtom =
      Atom(name: '_CustomerServiceBase.customers', context: context);

  @override
  ObservableList<Customer> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableList<Customer> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$isCorrectLoadAtom =
      Atom(name: '_CustomerServiceBase.isCorrectLoad', context: context);

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

  late final _$getAllCustomerAsyncAction =
      AsyncAction('_CustomerServiceBase.getAllCustomer', context: context);

  @override
  Future<void> getAllCustomer() {
    return _$getAllCustomerAsyncAction.run(() => super.getAllCustomer());
  }

  @override
  String toString() {
    return '''
customers: ${customers},
isCorrectLoad: ${isCorrectLoad},
getLength: ${getLength}
    ''';
  }
}
