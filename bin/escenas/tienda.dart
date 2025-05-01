import '../usuariologin.dart';
import 'dart:io';

class Tienda {
 
  static Future<void> mostrarTienda(Usuario usuario) async {
    bool estoyEnTienda = true;

 while(estoyEnTienda){
    stdout.writeln('''
  🏪 Tienda de Recuerdos
      Monedas disponibles: ${usuario.monedas}
      Mr.Mime: Buen día, viajero.¿Qué deseas comprar? 
      
      1️⃣ Postal - 5 monedas
      2️⃣ Llavero - 15 monedas
      3️⃣ Camiseta - 30 monedas
      4️⃣ Gorro - 20 monedas
      5️⃣ Salir de la tienda

    Elige una opción (1-5):
      
      ''');
    String? eleccion = stdin.readLineSync();

    switch(eleccion){
      case "1": 
        if(usuario.monedas >= 5){
          usuario.monedas -= 5;
          await usuario.actualizarMonedas();
          stdout.writeln('''¡Has comprado una bonita Postal! 📨
        (Mr. Mime: "¡Perfecto para enviar a tus amigos!")
        Monedas restantes: ${usuario.monedas}''');
        }else{
          stdout.writeln('''¡No tienes suficientes monedas!
          Necesitas 5 monedas y tienes ${usuario.monedas}''');
        }
        break;
      case "2":
      if(usuario.monedas >= 15){
        usuario.monedas -=15; 
        await usuario.actualizarMonedas();
        stdout.write('''¡Has comprado un Llavero muy guay! 🔑
        (Mr. Mime: "¡Sonará como campanitas cuando camines!")
        Monedas restantes: ${usuario.monedas}''');  
      }else{
        stdout.writeln('''No tienes suficientes monedas!
          Necesitas 15 monedas y tienes ${usuario.monedas}''');
      }
        break;
      case "3": 
      if(usuario.monedas >= 30){
        usuario.monedas -=30;
        await usuario.actualizarMonedas();
        stdout.write('''¡Has comprado una Camiseta de la ciudad! 👕
        (Mr. Mime: "¡Que diseño tan molón has escogido!")
        Monedas restantes: ${usuario.monedas}''');
      }else{
         stdout.writeln('''No tienes suficientes monedas!
          Necesitas 30 monedas y tienes ${usuario.monedas}''');
      }
        break;
      case "4": 
      if(usuario.monedas >=20){
        usuario.monedas -= 20;
        await usuario.actualizarMonedas();
        stdout.writeln('''¡Has comprado un Gorro! 🧢
      (Mr. Mime: "¡Protege del sol durante tus viajes!")
      Monedas restantes: ${usuario.monedas}''');
      }else{
        stdout.writeln('''No tienes suficientes monedas!
          Necesitas 20 monedas y tienes ${usuario.monedas}''');
      }
      break;
      case "5":
      stdout.writeln('Mr. Mime: "¡Vuelve pronto, viajero!"');
      estoyEnTienda = false;

      default:
      stdout.write('"Mr. Mime: ¿Qué has dicho, chaval? No te he entendido."');
    }

  
  }
  }

}