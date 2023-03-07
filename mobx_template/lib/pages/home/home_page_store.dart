import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../counter/counter_page.dart';
import 'home_page.dart';

part 'home_page_store.g.dart';

@Injectable()
class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  @observable
  int initialCount = 0;

  @action
  void changeInitialValue(BuildContext context, String value) {
    final counter = int.tryParse(value);
    if (counter == null) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text("Error parsing $value"),
        ),
      );
    } else {
      initialCount = counter;
    }
  }

  @action
  void navigateToCounter(BuildContext context) {
    CounterRoute(initialCounter: initialCount).push(context);
  }
}
