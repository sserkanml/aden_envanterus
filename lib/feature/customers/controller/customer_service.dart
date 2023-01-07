import 'dart:convert';
import 'dart:io';

import 'package:aden/core/constant/service_constant.dart';
import 'package:aden/feature/authentication/controller/user_session.dart';
import 'package:aden/feature/customers/model/customer.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'customer_service.g.dart';

class CustomerService = _CustomerServiceBase with _$CustomerService;

abstract class _CustomerServiceBase with Store {
  @observable
  ObservableList<Customer> customers = ObservableList<Customer>();

  @observable
  bool isCorrectLoad = false;

  @computed
  int get getLength => customers.length;
  @action
  Future<void> getAllCustomer() async {
    final url = Uri.http(Modular.get<ServiceConstant>().baseUrl,
        Modular.get<ServiceConstant>().getCustomer);
    try {
      final response = await http.get(url,
          headers: {"cookie": Modular.get<UserSession>().userSession});
      if (response.statusCode == HttpStatus.ok) {
        final result = jsonDecode(response.body);
        if (result is List) {
          customers = ObservableList.of(
              result.map<Customer>((e) => Customer.fromMap(e)).toList());
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
