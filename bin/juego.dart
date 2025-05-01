import 'usuariologin.dart';
import 'escenas/madrid.dart';
import 'escenas/sevilla.dart';

class Juego{
  static iniciarAventura(Usuario usuario) async{
    final madrid = Madrid(usuario);
    await madrid.mostrarOpciones();

    final sevilla = Sevilla(usuario);
    await sevilla.mostrarOpciones();

  }
}