import 'package:mobx/mobx.dart';
part 'page_navigation.g.dart';

class PageNavigation = _PageNavigationBase with _$PageNavigation;

abstract class _PageNavigationBase with Store {
  @observable
  int idPage = 0;

  @action
  void changePage(int id) {
    idPage = id;
  }
}
