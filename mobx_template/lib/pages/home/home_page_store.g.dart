// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStoreBase, Store {
  late final _$initialCountAtom =
      Atom(name: '_HomePageStoreBase.initialCount', context: context);

  @override
  int get initialCount {
    _$initialCountAtom.reportRead();
    return super.initialCount;
  }

  @override
  set initialCount(int value) {
    _$initialCountAtom.reportWrite(value, super.initialCount, () {
      super.initialCount = value;
    });
  }

  late final _$_HomePageStoreBaseActionController =
      ActionController(name: '_HomePageStoreBase', context: context);

  @override
  void changeInitialValue(BuildContext context, String value) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.changeInitialValue');
    try {
      return super.changeInitialValue(context, value);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToCounter(BuildContext context) {
    final _$actionInfo = _$_HomePageStoreBaseActionController.startAction(
        name: '_HomePageStoreBase.navigateToCounter');
    try {
      return super.navigateToCounter(context);
    } finally {
      _$_HomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialCount: ${initialCount}
    ''';
  }
}
