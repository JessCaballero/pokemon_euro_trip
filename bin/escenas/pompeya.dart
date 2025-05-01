import '../usuariologin.dart';
import "ciudad.dart";
import 'anfiteatropompeya.dart';
import 'casadelosvettii.dart';

class Pompeya extends Ciudad {
  Pompeya(Usuario usuario) : super(
    usuario: usuario,
    nombre: "Pompeya",
    descripcion: "...",
  opcion1: "1️⃣ Visitar el Anfiteatro de Pompeya ",
  opcion2: "2️⃣ Visitar La Casa de los Vettii",
  );
  @override
  Future<void> hacerAccion1() async{
    Anfiteatropompeya.escena(usuario);
  }
  @override
  Future<void> hacerAccion2() async{
    Casadelosvettii.escena(usuario);
  }
  
}