import 'package:aprendendo_mobx_consultacep/stores/controller_cep.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {

  final controllercep = ControllerCep(); 


}