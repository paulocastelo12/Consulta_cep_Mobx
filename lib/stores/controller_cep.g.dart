// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_cep.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerCep on _ControllerCepBase, Store {
  final _$cepAtom = Atom(name: '_ControllerCepBase.cep');

  @override
  String get cep {
    _$cepAtom.context.enforceReadPolicy(_$cepAtom);
    _$cepAtom.reportObserved();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.context.conditionallyRunInAction(() {
      super.cep = value;
      _$cepAtom.reportChanged();
    }, _$cepAtom, name: '${_$cepAtom.name}_set');
  }

  final _$isloadAtom = Atom(name: '_ControllerCepBase.isload');

  @override
  bool get isload {
    _$isloadAtom.context.enforceReadPolicy(_$isloadAtom);
    _$isloadAtom.reportObserved();
    return super.isload;
  }

  @override
  set isload(bool value) {
    _$isloadAtom.context.conditionallyRunInAction(() {
      super.isload = value;
      _$isloadAtom.reportChanged();
    }, _$isloadAtom, name: '${_$isloadAtom.name}_set');
  }

  final _$listcepmodelAtom = Atom(name: '_ControllerCepBase.listcepmodel');

  @override
  List<CepModel> get listcepmodel {
    _$listcepmodelAtom.context.enforceReadPolicy(_$listcepmodelAtom);
    _$listcepmodelAtom.reportObserved();
    return super.listcepmodel;
  }

  @override
  set listcepmodel(List<CepModel> value) {
    _$listcepmodelAtom.context.conditionallyRunInAction(() {
      super.listcepmodel = value;
      _$listcepmodelAtom.reportChanged();
    }, _$listcepmodelAtom, name: '${_$listcepmodelAtom.name}_set');
  }

  final _$searchCepAsyncAction = AsyncAction('searchCep');

  @override
  Future searchCep() {
    return _$searchCepAsyncAction.run(() => super.searchCep());
  }

  final _$_ControllerCepBaseActionController =
      ActionController(name: '_ControllerCepBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_ControllerCepBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_ControllerCepBaseActionController.endAction(_$actionInfo);
    }
  }
}
