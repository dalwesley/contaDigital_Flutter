// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardStore on _CardStore, Store {
  final _$cardDetailsStateAtom = Atom(name: '_CardStore.cardDetailsState');

  @override
  String get cardDetailsState {
    _$cardDetailsStateAtom.context.enforceReadPolicy(_$cardDetailsStateAtom);
    _$cardDetailsStateAtom.reportObserved();
    return super.cardDetailsState;
  }

  @override
  set cardDetailsState(String value) {
    _$cardDetailsStateAtom.context.conditionallyRunInAction(() {
      super.cardDetailsState = value;
      _$cardDetailsStateAtom.reportChanged();
    }, _$cardDetailsStateAtom, name: '${_$cardDetailsStateAtom.name}_set');
  }

  final _$busyAtom = Atom(name: '_CardStore.busy');

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

  final _$cardDetailsAtom = Atom(name: '_CardStore.cardDetails');

  @override
  ObservableList<CardDetailsModel> get cardDetails {
    _$cardDetailsAtom.context.enforceReadPolicy(_$cardDetailsAtom);
    _$cardDetailsAtom.reportObserved();
    return super.cardDetails;
  }

  @override
  set cardDetails(ObservableList<CardDetailsModel> value) {
    _$cardDetailsAtom.context.conditionallyRunInAction(() {
      super.cardDetails = value;
      _$cardDetailsAtom.reportChanged();
    }, _$cardDetailsAtom, name: '${_$cardDetailsAtom.name}_set');
  }

  final _$_CardStoreActionController = ActionController(name: '_CardStore');

  @override
  void changeSelectedCardDetails(String state) {
    final _$actionInfo = _$_CardStoreActionController.startAction();
    try {
      return super.changeSelectedCardDetails(state);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCardDetails(CardDetailsModel item) {
    final _$actionInfo = _$_CardStoreActionController.startAction();
    try {
      return super.addCardDetails(item);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardDetails(List<CardDetailsModel> items) {
    final _$actionInfo = _$_CardStoreActionController.startAction();
    try {
      return super.setCardDetails(items);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCardDetails() {
    final _$actionInfo = _$_CardStoreActionController.startAction();
    try {
      return super.clearCardDetails();
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }
}
