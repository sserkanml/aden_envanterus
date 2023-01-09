import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';
part 'connectivity_service.g.dart';

class ConnectivityService = _ConnectivityServiceBase with _$ConnectivityService;

abstract class _ConnectivityServiceBase with Store {
  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @observable
  bool isFirstConnected = true;

  @action
  Future<void> getConnectivity() async {
    final result =await Connectivity().checkConnectivity();
    isFirstConnected = result==ConnectivityResult.none ? false : true;
  }

  @action
  void dispose() {}
}
