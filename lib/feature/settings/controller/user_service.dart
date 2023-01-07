import 'dart:convert';
import 'dart:io';

import 'package:aden/core/constant/service_constant.dart';
import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:aden/feature/settings/model/user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'user_service.g.dart';

class MemberService = _MemberServiceBase with _$MemberService;

abstract class _MemberServiceBase with Store {
  @observable
  ObservableList<Member> members = ObservableList<Member>();

  @observable
  bool isCorrectLoad = false;

  @computed
  int get getLength => members.length;

  @action
  Future<void> getAllMember() async {
    final url = Uri.http(Modular.get<ServiceConstant>().baseUrl,
        Modular.get<ServiceConstant>().getMember);

    try {
      final response = await http.get(url,
          headers: {"cookie": Modular.get<UserSession>().userSession});
      if (response.statusCode == HttpStatus.ok) {
        final result = jsonDecode(response.body);

        if (result is List) {
          members = ObservableList.of(
              [...result.map<Member>((e) => Member.fromMap(e)).toList()]);

          isCorrectLoad = true;
        } else {
          isCorrectLoad = false;
        }
      } else {
        isCorrectLoad = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
