import 'dart:io';
import '../usuariologin.dart';
import 'madrid.dart';


class Retiro {
  static escena(Usuario usuario) async{
    stdout.write('''
    Pikachu se adentra por los caminos del Retiro. 
    Los Skwovet corretean cerca y las hojas secas crujen bajo sus patas.
    
    De pronto, sobre una rama, un Pidgey le saluda
    
    Pidgey: ¡Ey, ${usuario.usuario} ! ¿Qué pasa, tío? Se te ve con ganas de moverte. ¿Dónde vas?
    
    ''');
    stdout.writeln('''${usuario.usuario}:
      1️⃣ Me voy a recorrer Europa y conocer nuevos Pokémon.
      2️⃣ Solo estoy dando una vuelta, nada especial.
      3️⃣ ¡Voy con algo de prisa, Pidgey!¡Luego nos vemos!
       ''');
      
    String eleccion;

    do{
      stdout.write("Elige 1, 2 ó 3: ");
      eleccion = stdin.readLineSync() ?? "error";
      }while (eleccion != "1" && eleccion !="2" && eleccion !="3");

      switch(eleccion){
        case "1" : 
        stdout.writeln('''Pidgey: ¡Vaya! Eso suena emocionante. 
        Si vas a Sevilla, visita al Oricorio que vive por allí, es muy orgulloso... ¡pero muy simpático si le caes bien! 
        De vez en cuando coge estudiantes de Sevillana
        ''');
        case "2" :
        stdout.write('''Pidgey: Bueno, si cambias de idea, la estación siempre está abierta. 
        Dicen que los trenes son la mejor forma de empezar un viaje.

        ''');
        break;
        case "3":
        stdout.writeln("Pidgey: ¡Vale, nos vemos ${usuario.usuario}! No te pierdas mucho por el Retiro.");
        Madrid ciudad=Madrid(usuario);
        await ciudad.mostrarOpciones();
        return;
      }
  }
}