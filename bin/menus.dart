 
 import 'dart:io';
 import 'usuariologin.dart';
 import 'database.dart';
 import 'juego.dart';

 class Menus {
  Usuario usuario = Usuario();
  
  static String inicio(){
  String? menuLoginReg; 

  do{
  stdout.writeln('''Bienvenido a Pokémon Euro Trip. 
   Si deseas registrarte presiona: 1. 
   Si ya tienes cuenta con nosotros presiona: 2
   Si deseas salir presiona: 3''');
   menuLoginReg = stdin.readLineSync() ?? "error";

  }while(menuLoginReg !='1' && menuLoginReg !='2' && menuLoginReg !="3");

  return(menuLoginReg);
  }

  static menu() async{
    String menuLoginReg = inicio(); 

   switch(menuLoginReg){
    case "1" : registro();
    break;
    case "2" : entrar(); 
    break;
    case "3" : salir();
    default: print("Opción no válida. Por favor, elige 1, 2 ó 3");
   }

  }

  static registro() async {
    bool creado =false;
    
    do{
    creado = false; 
    stdout.writeln('''¡Bienvenido! Antes de viajar 
    tenemos que preparar tu pasaporte. ¿Cómo te llamas? ''');
    String nombre = stdin.readLineSync() ?? "error";
    stdout.writeln("Ahora es necesario crear una clave secreta. Escribela ahora: ");
    String password =stdin.readLineSync() ?? "error";
    bool nombreExiste =await Usuario.comprobarSiExiste(nombre);

    if (nombreExiste){
      stdout.writeln("Este pasaporte ya existe, por favor prueba con otro nombre");  
    }else{
      Usuario usuario = Usuario();
      usuario.usuario = nombre;
      usuario.password = password;
      creado =await usuario.save();

      if(creado){
        stdout.writeln("¡Pasaporte creado!Ahora ingresa para iniciar tu Poké-aventura en Europa✈️:");
        await entrar();
      }
    }

   }while(!creado);
  }

  static entrar() async {
    bool logueado =false;
    var conn;
    
    try{ 
      conn = await Database.obtenerConexion();    
    do{
      
      stdout.write("¡Bienvenido, viajero!¿Cúal es tu pasaporte?: ");
      String nombre = stdin.readLineSync() ?? "error";
      stdout.write("¿Cúal es tu contraseña?: ");
      String password =stdin.readLineSync() ?? "error";
      
      var resultado = await conn.query(
        "SELECT * FROM usuarios WHERE nombre = ? AND password = ?",
        [nombre,password]
      );
      if(resultado.length > 0){
        stdout.writeln("¡Listos para la aventura!");
        Usuario usuario = Usuario();
        usuario.usuario = nombre;
        usuario.password = password;
        logueado = true;
        await Juego.iniciarAventura(usuario);
      } else{
        stdout.write("¡Epa!¡Algo ha salido mal!");
      }
    }while(!logueado);
    }catch(e){
      print("Error al iniciar sesión $e");
    }finally{
      await conn?.close();
    }

  }

  static salir() async {
    print("¡Hasta luego, vuelve pronto!");
    return;
  }
  
 }
 