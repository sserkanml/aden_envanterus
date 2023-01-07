import 'package:aden/feature/checks/controller/check_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'check_info_general.dart';
part 'check_info_service.g.dart';

class CheckInfoService = _CheckInfoServiceBase with _$CheckInfoService;

abstract class _CheckInfoServiceBase with Store {
  @observable
  ObservableList<CheckInfoGeneral> checkInfo =
      ObservableList<CheckInfoGeneral>.of([
    CheckInfoGeneral(
        label: "Onaylanan Sayımlar",
        quantity: Modular.get<CheckService>().getConfirmedCheck,
        color: Colors.green),
    CheckInfoGeneral(
        label: "Bekleyen  Sayımlar",
        quantity: Modular.get<CheckService>().getPendingCheck,
        color: Colors.yellow),
    CheckInfoGeneral(
        label: "İptal Sayımlar",
        quantity: Modular.get<CheckService>().getCancelCheck,
        color: Colors.red),
    CheckInfoGeneral(
        label: "Tüm Sayımlar",
        quantity: Modular.get<CheckService>().getAllCheckLength,
        color: Colors.blue),
  ]);
}
