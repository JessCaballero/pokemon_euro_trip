import '../usuariologin.dart';
import 'ciudad.dart';
import 'playadedesembarco.dart';
import 'castillocaen.dart';

class Caen extends Ciudad{
  Caen(Usuario usuario) : super(
    usuario: usuario,
    nombre: "Caen",
    descripcion: '''...''',
  opcion1: "1️⃣ Pasear por la Playa del Desembarco  ",
  opcion2: "2️⃣ Ir a el Castillo de Caen  ",
  );
  @override
  Future<void> hacerAccion1() async{
    Playadedesembarco.escena(usuario);
  }
 @override
 Future<void> hacerAccion2() async{
  Castillocaen.escena(usuario);
 }
 
}


