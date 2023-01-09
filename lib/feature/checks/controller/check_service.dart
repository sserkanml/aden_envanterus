import 'dart:convert';
import 'dart:io';

import 'package:aden/feature/checks/model/check.dart';
import 'package:aden/feature/checks/model/show_checks.dart';
import 'package:aden/feature/customers/controller/customer_service.dart';
import 'package:aden/feature/item/controller/item_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../../../core/constant/service_constant.dart';
import '../../authentication/controller/user_session.dart';
import '../model/check_detail.dart';
part 'check_service.g.dart';

class CheckService = _CheckServiceBase with _$CheckService;

abstract class _CheckServiceBase with Store {
  @observable
  ObservableList<Check> checks = ObservableList<Check>();

  ObservableList<ShowCheck> showCheck = ObservableList<ShowCheck>();

  @observable
  ObservableList<CheckDetail> checkDetails = ObservableList<CheckDetail>();

  @computed
  int get getPendingCheck {
    return checkDetails
        .where((element) => element.onayDurum == 2)
        .toList()
        .length;
  }

  @action
  void getShowCheck() {
    for (var element in checkDetails) {
      showCheck.add(ShowCheck(
          companyName: Modular.get<CustomerService>()
                  .customers
                  .firstWhere((customer) => customer.oid == element.musteriID)
                  .musteriFirmaAdi ??
              "",
              dateSaved: element.kayitZamani ?? " ",
              unitName: Modular.get<ItemService>()
                  .items
                  .firstWhere((item) => item.oid == element.malzeme)
                  .birim ??
              "" ,
          quantity:
              checks.firstWhere((check) => check.sayim == element.oid).miktar ??
                  0,
          itemName: Modular.get<ItemService>()
                  .items
                  .firstWhere((item) => item.oid == element.malzeme)
                  .adi ??
              "",
          companyId: Modular.get<CustomerService>()
                  .customers
                  .firstWhere((customer) => customer.oid == element.musteriID)
                  .oid ??
              "",
          itemId: Modular.get<ItemService>()
                  .items
                  .firstWhere((item) => item.oid == element.malzeme)
                  .oid ??
              ""));
    }
    for (var i = 0; i < checks.length; i++) {}
  }

  @computed
  int get getAllCheckLength => checkDetails.length;

  @computed
  int get getCancelCheck =>
      checkDetails.where((element) => element.onayDurum == 0).toList().length;

  @computed
  int get getConfirmedCheck =>
      checkDetails.where((element) => element.onayDurum == 1).toList().length;

  @observable
  bool isCorrectLoad = false;

  @action
  Future<void> getAllCheck() async {
    final url = Uri.http(Modular.get<ServiceConstant>().baseUrl,
        Modular.get<ServiceConstant>().getCheck);

    try {
      final response = await http.get(url,
          headers: {"cookie": Modular.get<UserSession>().userSession});
      if (response.statusCode == HttpStatus.ok) {
        final result = jsonDecode(response.body);

        if (result is Map) {
          final listCheck = result["jsonData_1"];
          final listCheckDetail = result["jsonData_3"];
          if (listCheck is List && listCheckDetail is List) {
            checks = ObservableList.of(
                listCheck.map<Check>((e) => Check.fromMap(e)).toList());
            checkDetails = ObservableList.of(listCheckDetail
                .map<CheckDetail>((e) => CheckDetail.fromMap(e))
                .toList());
            getShowCheck();
            isCorrectLoad = true;
          } else {
            isCorrectLoad = false;
          }
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
