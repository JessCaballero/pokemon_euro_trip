import '../usuariologin.dart';
import 'ciudad.dart';
import 'palaciopombal.dart';
import 'centrocienciaviva.dart';

class Oeiras extends Ciudad{
  Oeiras(Usuario usuario) : super ( 
    usuario: usuario,
    nombre: "Oeiras",
    descripcion: '''...''',
  opcion1: "1️⃣ Visitar el Centro Ciência Viva de Oeiras ",
  opcion2: "2️⃣ Ir a Palácio do Marquês de Pomba  ",
  );
  @override
  Future<void> hacerAccion1() async{
   Palaciopombal.escena(usuario);
  }
  @override
  Future<void> hacerAccion2() async{
    Centrocienciaviva.escena(usuario);
  }

  
}