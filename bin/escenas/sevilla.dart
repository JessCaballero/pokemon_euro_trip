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
 accion1: (usuario) => Plazaespana.escena(usuario),
 accion2: (usuario) => Barriotriana.escena(usuario),
  );


}
