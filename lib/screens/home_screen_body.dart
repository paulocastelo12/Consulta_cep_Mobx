import 'package:aprendendo_mobx_consultacep/models/cep_models.dart';
import 'package:aprendendo_mobx_consultacep/shared/Theme.dart';
import 'package:aprendendo_mobx_consultacep/stores/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class HomeBody extends StatelessWidget {

  _textField({String labelText, onChange, String Function() erroText}){

    //var controller = new MaskedTextController(mask: '00000-000');
    return TextField(
      style: TextStyles.Descr,
      onChanged: onChange,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: erroText == null ? null : erroText()
        // errorText: 'erro'
      ),
       keyboardType: TextInputType.number,
      
    );
  } 


  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context);

    return  Container(
          margin: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
                Observer(
                  builder: (_){
                    return _textField(
                            labelText: 'CEP',
                            erroText: controller.controllercep.validateCep,
                            onChange: controller.controllercep.changeEmail
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                   return  RaisedButton(
                    onPressed: controller.controllercep.isValid ? (){
                      controller.controllercep.searchCep();
                    } : null,
                    child: Text('Consultar'),
                  );
                },
                ),
                  SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                   if(controller.controllercep.isload){
                      return CircularProgressIndicator();
                   }else{

                    CepModel cepModelRes =  controller.controllercep.listcepmodel == null ? null : controller.controllercep.listcepmodel[0];
         
                   if(cepModelRes != null){

                     if(cepModelRes.logradouro == null){
                       return Text("CEP não encontrado!", style: TextStyles.Descr,);
                     }

                      return Container(
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text('Logradouro: ${cepModelRes.logradouro}', style: TextStyles.Descr),
                              Text('Bairro: ${cepModelRes.bairro}', style: TextStyles.Descr),
                              Text('Município: ${cepModelRes.localidade}' , style: TextStyles.Descr),
                              Text('UF: ${cepModelRes.uf}' , style: TextStyles.Descr),
                              Text('IBGE: ${cepModelRes.ibge}' , style: TextStyles.Descr)

                            ],
                          )
                         
                        ],
                        ),
                      );

                   }else{
                     return Container();
                   }

                   }
                  
                },
                )
               
               
            ],
          ),

      );
  }
}