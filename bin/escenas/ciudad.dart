import 'dart:io';
import '../usuariologin.dart';
import 'tienda.dart';
import 'estacionTren.dart';

abstract class Ciudad {
  final Usuario usuario;
  final String nombre;
  final String descripcion;
  final String opcion1;
  final String opcion2;


  Ciudad({
    required this.usuario,
    required this.nombre,
    required this.descripcion,
    required this.opcion1,
    required this.opcion2,
   
  });

  Future<void> hacerAccion1();
  Future<void> hacerAccion2();

  Future<void> mostrarOpciones() async {
    stdout.writeln(descripcion);
    String eleccion;

    do {
      stdout.writeln('''¿Qué quiere hacer Pikachu?
     $opcion1
     $opcion2
     3️⃣ Comprar recuerditos en la tienda
     4️⃣ Ir a la estación de tren
      ''');

      eleccion = stdin.readLineSync() ?? "error";

      switch (eleccion) {
        case "1":
          await hacerAccion1();
          break;
        case "2":
          await hacerAccion2();
          break;
        case "3":
          stdout.writeln("Entras a la tienda atendida por Mr.Mime");
          await Tienda.mostrarTienda(usuario);
          break;
        case "4":
          stdout.writeln("Pikachu se dirige a la estación de tren 🚄");
          await Estaciontren.escenaEstacion(usuario);
      }
    } while (eleccion != "4");
  }

  }






