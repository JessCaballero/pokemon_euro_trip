import '../usuariologin.dart';
import 'plazaespana.dart';
import 'barrioTriana.dart';
import 'ciudad.dart';


class Sevilla extends Ciudad {

  Sevilla(Usuario usuario) : super(
    usuario: usuario,
    nombre: "Sevilla",
    descripcion:'''
🚂 *El tren reduce la velocidad y se detiene suavemente en la estación de Sevilla.*
Pikachu salta de su asiento y observa por la ventana: palmeras, tejados rojizos y un sol que calienta hasta las orejas.

*La aventura en Sevilla comienza...* ⚡
''',
 opcion1: "1️⃣ Pasear por Plaza España.",
 opcion2: "2️⃣Ir al Barrio de Triana.//no incluida en el demo",
 );

 @override
 Future<void> hacerAccion1() async{
  await Plazaespana.escena(usuario);}
 @override
 Future<void> hacerAccion2() async{
 await Barriotriana.escena(usuario); } 
 
  


}
