
import 'package:aprendendo_mobx_consultacep/models/cep_models.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
part 'controller_cep.g.dart';

class ControllerCep = _ControllerCepBase with _$ControllerCep;

abstract class _ControllerCepBase with Store {

  @observable
  String cep = "";

  @action
  changeEmail(String value){
    cep = value;
  }

  // _ControllerCepBase(){
  //   autorun((_){
  //     print(cep);
  //   });
  // }

  String validateCep(){
   if(cep.length < 8){
       return "Cep inválido";
    }

    return null;
  }

  bool get isValid{
    return validateCep() == null;
  }

  @observable
  bool isload = false;

  // @observable
  // String rua = "";

  // @observable
  // String bairro = "";

  // @observable
  // String localidade = "";

  // @observable
  // String uf = "";

  // @observable
  // String ibge = "";

  @observable
  List<CepModel> listcepmodel;


  @action
  searchCep() async {
    print(cep);

    isload = true;

    var dio = Dio();

    await Future.delayed(Duration(seconds: 1));
    
    var response = await dio.get('https://viacep.com.br/ws/'+cep+'/json/');

     if (response.statusCode == 200) {
  
      CepModel cepModel = CepModel();

      listcepmodel = List();

      cepModel.logradouro = response.data['logradouro'];
      cepModel.bairro = response.data['bairro'];
      cepModel.localidade = response.data['localidade'];
      cepModel.uf = response.data['uf'];
      cepModel.ibge = response.data['ibge'];

      listcepmodel.add(cepModel);

      // rua         = "Logradouro: "+response.data['logradouro'];
      // bairro      = "Bairro: "+response.data['bairro'];
      // localidade  = "Cidade: "+response.data['localidade'];
      // uf          = "UF: "+response.data['uf'];
      // ibge        = "Ibge: "+response.data['ibge'];

      isload = false;

    } else {
      throw Exception('Falha ao carregar um post');
    }
   
  }

}