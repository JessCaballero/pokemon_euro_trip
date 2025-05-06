import 'retiro.dart';
import 'puertaDelSol.dart';
import 'ciudad.dart';
import '../usuariologin.dart';


class Madrid extends Ciudad {
  

  Madrid(Usuario usuario) : super(
    usuario: usuario,
    nombre: "Madrid",
    descripcion: '''📍 Localización: Madrid, Parque del Retiro

El sol de la mañana acaricia las hojas de los árboles.  
Pikachu abre los ojos dentro de su pequeña madriguera, junto a un montón de manzanas.  
Hoy no es un día cualquiera.

Desde hace semanas siente en su pequeño corazón eléctrico un deseo enorme:  
¡quiere viajar por Europa y conocer nuevos Pokémon!

Sus mejillas chispean ligeramente de emoción. Pero antes de empezar su aventura, aún tiene tiempo de pasear por su querida ciudad. ''',
  opcion1: "1️⃣ Pasear por El Retiro.",
  opcion2: "2️⃣ Ir a la Puerta del Sol.  ",
  );
  @override
  Future<void> hacerAccion1() async{
    await Retiro.escena(usuario);
  }
  @override
  Future<void> hacerAccion2() async{
    await Puertadelsol.escena(usuario);
  }
 
}