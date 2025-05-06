import 'dart:io';
import '../usuariologin.dart';
import '../pokemon.dart';
import 'madrid.dart';

class Puertadelsol {
  static escena(Usuario usuario) async {
    try {
      usuario.monedas = await usuario.obtenerMonedas();

      stdout.writeln('''
📍 Localización: Puerta del Sol, Madrid
Pikachu pasea por la animada plaza cuando de repente...
¡Un Meowth callejero aparece con mirada traviesa! 

"Meowth: ¡Nyaha! Esas monedas que llevas en tu bolsita me vendrían genial... 
¡Déjame echar un vistazo, pequeñajo!"''');

      Pokemon? pikachu = await obtenerPokemon('pikachu');
      Pokemon? meowth = await obtenerPokemon('meowth');

      if (pikachu == null || meowth == null){
        stdout.writeln("Error al cargar los Pokémon");
        Madrid ciudad =Madrid(usuario);
        await ciudad.mostrarOpciones();
        return;
      }
      
        stdout.writeln('''
⚡ ¡Meowth quiere pelear! ⚡

Pikachu ( HP: ${pikachu.vida}) vs Meowth (HP: ${meowth.vida})

¿Qué haces?
1️⃣ Usar Impactrueno
2️⃣ Usar Agilidad
3️⃣ Intentar huir''');

        bool peleaTerminada = false;
        int monedasGanadas = 0;
        int monedasPerdidas = 10;

        while (!peleaTerminada) {
          String? eleccion = stdin.readLineSync();

          switch (eleccion) {
            case "1":
              meowth.vida -= 40;
              stdout.writeln('''
  ¡Usas Impactrueno! 
  Meowth recibe 40 de daño. HP restante: ${meowth.vida > 0 ? meowth.vida : 0}''');
              if (meowth.vida <= 0) {
                peleaTerminada = true;
                monedasGanadas = 20;
                usuario.monedas += monedasGanadas;
                await usuario.actualizarMonedas();

                stdout.writeln('''¡Meowth se debilita y cae al suelo!
    
    Meowth: ¡Nyaha...madre mía que eres fuerte! Vale, vale, toma estas $monedasGanadas monedas. 
    Con ellas puedes comprar recuerditos en las tiendas de cada ciudad. 
    ¡Los vendedores adoran a los Pokémon viajeros!
    ''');
              } else {
                pikachu.vida -= 25;
                stdout.writeln('''¡Meowth usa Arañazo!
    Recibes 25 de daño. HP restante: ${pikachu.vida}''');
              }
              break;
            case "2":
              stdout.writeln('''¡Te mueves muy rápidamente!
    Meowth falla su ataque.''');
              break;

            case "3":
              peleaTerminada = true;
              usuario.monedas = (usuario.monedas - monedasPerdidas)
                  .clamp(0, double.infinity)
                  .toInt();
              await usuario.actualizarMonedas();
              stdout.writeln(
                  '''Logras escapar pero Meowth se queda con algunas monedas...
    ¡Mejor suerte para la próxima vez, chaval!''');
              break;

            default:
              stdout.writeln('''Opción no válida. Elige 1, 2 ó 3''');
          }

          if (pikachu.vida <= 0) {
            peleaTerminada = true;
            usuario.monedas = (usuario.monedas - monedasPerdidas)
                .clamp(0, double.infinity)
                .toInt();
            await usuario.actualizarMonedas();

            stdout.writeln('''
      ¡Te has desmayado y no puedes continuar!
      Meowth se lleva $monedasPerdidas monedas antes de irse... Ahora tienes ${usuario.monedas} monedas''');
          }
        }

      
    } catch (e) {
      stdout.writeln("error en la escena Puerta del Sol; $e");
      usuario.monedas = 50;
      Madrid ciudad =Madrid(usuario);
      await ciudad.mostrarOpciones();
    }
  }

}