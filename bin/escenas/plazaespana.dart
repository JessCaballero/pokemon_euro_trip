import 'dart:io';
import '../usuariologin.dart';
import 'barriotriana.dart';
import 'sevilla.dart';

class Plazaespana {
  static escena(Usuario usuario) async{
      stdout.writeln(''' Avanzas por el sendero de piedra, tus pequeñas patas resonando 
    suavemente contra el suelo. Al pasar un arco de árboles altos, una enorme explanada se abre frente a tí: Plaza de España.
    La luz del sol bañaba los majestuosos edificios de ladrillo rojo y cerámica colorida, mientras un canal de agua brilla 
    como un espejo alrededor de la plaza.

  Parpadeas, maravillado, moviendo tus orejitas de un lado a otro para captar cada sonido: 
  el murmullo del agua, las risas lejanas y el eco de pasos sobre los puentes arqueados.
  Bandadas de Wingulls surcan el cielo azul, y cerca del canal, un pequeño grupo de Lotads flota perezosamente.
  La brisa suave arrastra el dulce aroma de las flores cercanas, y todo parece invita a explorar cada 
  rincón de aquel lugar.
  Con curiosidad te acercas a uno de los puentes de piedra decorados con azulejos brillantes.
  
Mientras cruzas el puente, un suave ritmo de palmas y zapateos llena el aire.
Guiado por el sonido, llegas a un pequeño claro en la Plaza, donde un Oricorio de plumaje rojo intenso gira con una gracia impresionante,
 moviéndose al compás de una melodía que parece surgir de la misma tierra.

Con los ojos brillando de entusiasmo, te acercas al ritmo de pasitos rápidos.

—¡Buenas! —saludas, agitando la patita—. ¡Qué arte tienes bailando!⚡

Oricorio se detiene con una última vuelta elegante y le dedica una reverencia orgullosa.

—Gracias, chiquillo —responde con una voz melodiosa—. Aquí en Sevilla, el arte corre por las venas. 
¿Te gustaría aprender a bailar la Sevillana?🐦💃

Asientes con una amplia sonrisa.

—¡Claro que sí! ¡Me encantaría aprender!⚡

Oricorio ladea la cabeza y te dedica una sonrisa pícara.

—Antes de enseñarte, tienes que pasar una pequeña prueba.🐦💃
He pensado en un número del 1 al 10.
Si lo aciertas, te enseñaré los primeros pasos.
Si no… bueno, tendrás que practicar un poco más antes de merecer la lección.

Te plantas firme, las mejillas te brillan de emoción. Te frotas las patitas, preparado para el reto.

Oricorio da un pequeño salto hacia atrás, batiendo las alas con energía, mientras a su alrededor parece encenderse el aire de expectación.

El desafío está servido.
Respiras hondo... y te dispones a hacer tu primera elección.''');


String numRandomString = "7";
String? respuestaJuego;
do{

  stdout.writeln("Oricorio te mira con una sonrisa pícara 💃.");
  stdout.writeln("Oricorio: He pensado en un número del 1 al 10.");
  stdout.writeln("Oricorio: ¡Tendrás que adivinarlo si quieres aprender a bailar conmigo!");

  stdout.write("Elige un número entre el 1 y el 10: ");
  respuestaJuego = stdin.readLineSync() ?? "error";

  if(respuestaJuego == numRandomString ){
    stdout.writeln("Oricorio aplaude alegremente 💃: ¡Acertado, chiquillo! ¡Ahora comenzamos la lección!");
  }else{
    stdout.writeln("Oricorio sonríe y dice: ¡Sigue intentando, chiquillo!🐦💃");
    }
}while(respuestaJuego != numRandomString); 


stdout.writeln('''Cuando adivinas el número, Oricorio da un par de vueltas en el aire 💃 y aplaude emocionado.

—¡Olé, chiquillo! —dice con una gran sonrisa—. ¡Ahora sí, ven que te enseño!

Bajo el cálido sol de Sevilla ☀️, en medio del esplendor de la Plaza de España, Oricorio empieza a marcar el ritmo con las alas. 
Atento, imitas sus movimientos: pasos cortos, giros suaves, palmas alegres.
El aire huele a azahar, y el eco de los pasos resuena entre los arcos y las fuentes de mármol.
Te esfuerzas, tropezando alguna vez, pero pronto encuentras el compás, contagiado por la energía vibrante del lugar ⚡.

Oricorio asiente con orgullo.

—Nada mal para ser tu primera vez, chiquillo —dice—. ¡Tienes arte en esas patitas!

Tras un último giro, Oricorio se detiene y se inclina en una reverencia elegante.

—Fue un honor enseñarte 💃. Ahora lleva este ritmo contigo donde vayas, chiquillo.
¡Y que Sevilla siempre te acompañe en el corazón!

Lleno de alegría, hace una reverencia torpe pero sincera, y continúa su aventura, llevando el espíritu de la sevillana en cada paso. ⚡''');

  stdout.writeln('''
  ¿A dónde vamos ahora?
  1️⃣ Es hora de recorrer el Barrio de Triana.
  2️⃣ Volvamos al centro de Sevilla
  
  ''');

String eleccion;
do{ 
  stdout.writeln("Elige 1 ó 2: ");
  eleccion = stdin.readLineSync() ?? "error";
}while(eleccion != "1" && eleccion != "2");

switch(eleccion){
  case "1" :
  stdout.write("Te diriges al Barrio de Triana");
  await Barriotriana.escena(usuario);
  break;
  case "2":
  Sevilla sevilla =Sevilla(usuario);
  await sevilla.mostrarOpciones();
  break;
  default: 
  stdout.writeln("Opción no válida, elige 1 ó 2");
}

}

}