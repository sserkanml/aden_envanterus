// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemberService on _MemberServiceBase, Store {
  late final _$membersAtom =
      Atom(name: '_MemberServiceBase.members', context: context);

  @override
  ObservableList<Member> get members {
    _$membersAtom.reportRead();
    return super.members;
  }

  @override
  set members(ObservableList<Member> value) {
    _$membersAtom.reportWrite(value, super.members, () {
      super.members = value;
    });
  }

  late final _$isCorrectLoadAtom =
      Atom(name: '_MemberServiceBase.isCorrectLoad', context: context);

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

  late final _$getAllMemberAsyncAction =
      AsyncAction('_MemberServiceBase.getAllMember', context: context);

  @override
  Future<void> getAllMember() {
    return _$getAllMemberAsyncAction.run(() => super.getAllMember());
  }

  @override
  String toString() {
    return '''
members: ${members},
isCorrectLoad: ${isCorrectLoad}
    ''';
  }
}
