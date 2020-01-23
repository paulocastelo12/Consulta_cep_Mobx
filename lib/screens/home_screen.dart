
import 'package:aprendendo_mobx_consultacep/models/cep_models.dart';
import 'package:aprendendo_mobx_consultacep/screens/home_screen_body.dart';
import 'package:aprendendo_mobx_consultacep/stores/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

     final globalKey = GlobalKey<ScaffoldState>(); 

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context);

    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Observer(
            builder: (_){
              //  String localidade = controller.controllercep.localidade == "" ? controller.controllercep.localidade : controller.controllercep.localidade.substring(8);
              //  String uf = controller.controllercep.uf == "" ? controller.controllercep.uf : controller.controllercep.uf.substring(4);

              CepModel cepModelRes =  controller.controllercep.listcepmodel == null ? null : controller.controllercep.listcepmodel[0];

              String appBar = cepModelRes == null ? "" : '${cepModelRes.localidade} ${cepModelRes.uf}';

               return Text('CEP Brasil $appBar' );   
            },
        ),
         leading: IconButton(
                icon: new Icon(Icons.camera),
                 onPressed: (){
                openMenu(context);
              },
               )
        
      ),
       drawer: Drawer(

         child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child:ListView(
           children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(),
              ),
              ListTile(
                title: Text("Ttem 1"),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text("Item 2"),
                trailing: Icon(Icons.arrow_forward),
              )
           ],
         ),
       ),
       ),
      body: HomeBody()
    );
  }

  void openMenu(BuildContext context) {
    globalKey.currentState.openDrawer();  
  }


}

