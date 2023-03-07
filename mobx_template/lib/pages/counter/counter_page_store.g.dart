// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterPageStore on _CounterPageStore, Store {
  late final _$valueAtom =
      Atom(name: '_CounterPageStore.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_CounterPageStoreActionController =
      ActionController(name: '_CounterPageStore', context: context);

  @override
  void _setValue(int value) {
    final _$actionInfo = _$_CounterPageStoreActionController.startAction(
        name: '_CounterPageStore._setValue');
    try {
      return super._setValue(value);
    } finally {
      _$_CounterPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_CounterPageStoreActionController.startAction(
        name: '_CounterPageStore.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterPageStoreActionController.startAction(
        name: '_CounterPageStore.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
