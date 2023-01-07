import 'dart:convert';
import 'dart:io';

import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:aden/feature/item/model/item_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/service_constant.dart';
part 'item_service.g.dart';

class ItemService = _ItemServiceBase with _$ItemService;

abstract class _ItemServiceBase with Store {
  @observable
  ObservableList<ItemModel> items = ObservableList<ItemModel>();

  @observable
  bool isCorrectLoad = false;

  @action
  Future<void> getAllItem() async {
    final url = Uri.http(Modular.get<ServiceConstant>().baseUrl,
        Modular.get<ServiceConstant>().getItem);

    try {
      final response = await http.get(url,
          headers: {"cookie": Modular.get<UserSession>().userSession});
      if (response.statusCode == HttpStatus.ok) {
        final result = jsonDecode(response.body);
        print(result);
        if (result is Map) {
          final listItem = result["jsonData_1"];

          if (listItem is List) {
            items = ObservableList.of(
                listItem.map<ItemModel>((e) => ItemModel.fromMap(e)).toList());
            isCorrectLoad = true;
            print(items);
          } else {
            print(listItem);
            isCorrectLoad = false;
          }
        } else {
          print(result);
          isCorrectLoad = false;
        }
      } else {
        isCorrectLoad = true;
      }
    } catch (e) {
      print(e);
      isCorrectLoad = true;
    }
  }
}
