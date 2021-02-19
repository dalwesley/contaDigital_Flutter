// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$extractStateAtom = Atom(name: '_AppStore.extractState');

  @override
  String get extractState {
    _$extractStateAtom.context.enforceReadPolicy(_$extractStateAtom);
    _$extractStateAtom.reportObserved();
    return super.extractState;
  }

  @override
  set extractState(String value) {
    _$extractStateAtom.context.conditionallyRunInAction(() {
      super.extractState = value;
      _$extractStateAtom.reportChanged();
    }, _$extractStateAtom, name: '${_$extractStateAtom.name}_set');
  }

  final _$busyAtom = Atom(name: '_AppStore.busy');

  @override
  bool get busy {
    _$busyAtom.context.enforceReadPolicy(_$busyAtom);
    _$busyAtom.reportObserved();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.context.conditionallyRunInAction(() {
      super.busy = value;
      _$busyAtom.reportChanged();
    }, _$busyAtom, name: '${_$busyAtom.name}_set');
  }

  final _$extractAtom = Atom(name: '_AppStore.extract');

  @override
  ObservableList<ExtractModel> get extract {
    _$extractAtom.context.enforceReadPolicy(_$extractAtom);
    _$extractAtom.reportObserved();
    return super.extract;
  }

  @override
  set extract(ObservableList<ExtractModel> value) {
    _$extractAtom.context.conditionallyRunInAction(() {
      super.extract = value;
      _$extractAtom.reportChanged();
    }, _$extractAtom, name: '${_$extractAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void changeSelectedExtract(String state) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changeSelectedExtract(state);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addExtract(ExtractModel item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addExtract(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExtract(List<ExtractModel> items) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setExtract(items);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearExtract() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.clearExtract();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
