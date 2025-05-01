import 'dart:io';
import '../usuariologin.dart';
import 'sevilla.dart';
import 'madrid.dart';
import 'oeiras.dart';
import 'caen.dart';
import 'pompeya.dart';


class Estaciontren {
  static escenaEstacion(Usuario usuario) async{

    await _opcionesEstacion(usuario);
     }

    static Future<void> _opcionesEstacion(Usuario usuario) async{
      String eleccion;

      do{
        stdout.writeln(''' El sol de la mañana atraviesa los ventanales de la Estación Atocha, 
        iluminando las enormes plantas que decoran la terminal como si se tratara de un invernadero natural.
La multitud de viajeros se mueve de un lado a otro; entrenadores, Pokémon, turistas y ciudadanos madrileños conviven en un bullicio constante.

De pronto, entre los andenes y las máquinas expendedoras, aparece un mostrador flotante, adornado con luces moradas y destellos fantasmales.
Tras él, un Gengar uniformado con una gorra ladeada y un chaleco con el logo de "Renfe & Pokémon Co." te observa con una sonrisa traviesa.

—Gengar: Heh heh... bienvenido a Atocha, viajero. ¿A dónde te diriges hoy?
Frente a ti, una pantalla holográfica muestra las rutas disponibles:

      1️⃣ Sevilla, España.  
      2️⃣ Caen,Francia.  
      3️⃣ Oeiras, Portugal.  
      4️⃣ Pompeya, Italia.
      5️⃣ Regresar a Madrid ''');
      eleccion = stdin.readLineSync() ?? "error";

      switch(eleccion){
        case "1" : 
        stdout.writeln('''Gengar:¡¡Ah, Sevilla! Calorcito, cielos despejados y plazas llenas de Pokémon que adoran tomar el sol.
        Espero que tengas tus rayos bien cargados, Pikachu, porque allí hasta los Litleo sudan.''');
        Sevilla sevilla =Sevilla(usuario);
        await sevilla.mostrarOpciones();
        break;
        case "2" :
        stdout.writeln('''Gengar: Oh, Reims... esa ciudad está llena de torres antiguas, perfectas para Pokémon voladores.
        Espero que lleves las almohadillas bien secas, Pikachu, ¡allí siempre hay un vientecillo que hace cosquillas en los bigotes!''');
        Caen caen =Caen(usuario);
        await caen.mostrarOpciones();
        break;
        case "3":
        stdout.writeln('''Gengar: Oeiras, ¿eh? Buena elección, ratoncillo. Allí las brisas marinas siempre traen olor a aventuras...
        Eso sí, cuidado con los Wingull, tienen la mala costumbre de confundir colas eléctricas con bocadillos.''');
        Oeiras oeiras =Oeiras(usuario);
        await oeiras.mostrarOpciones();
        break;
        case "4":
        stdout.writeln('''Gengar: "Pompeya, ¡qué lugar tan chispeante! Las ruinas están llenas de huecos donde se esconden Geodude y 
        fósiles polvorientos.
        Ten cuidado con las patas, Pikachu... un paso en falso y terminas haciendo arqueología sin querer.''');
        Pompeya pompeya =Pompeya(usuario);
        await pompeya.mostrarOpciones();
        break;
        case "5":
        Madrid madrid =Madrid(usuario);
        await madrid.mostrarOpciones();
        break;
        default:
        stdout.writeln("Gengar: Chaval, habla más alto que no te he entendido");
      }
      }while(eleccion != "5");


    }

  
}