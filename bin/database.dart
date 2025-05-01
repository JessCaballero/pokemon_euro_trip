import 'package:mysql1/mysql1.dart';


class Database {
  static const String _host = 'localhost';
  static const int _port = 3306;
  static const String _usuario = 'root';
  static const String _nombreBBDD = 'pkmnEuroTrip';

  static instalarBBDD() async {
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _usuario,
    );
    var conn = await MySqlConnection.connect(settings);
    try{
      await _crearBBDD(conn);
      await _crearTablaUsuarios(conn);
      await _crearTablaEquipo(conn);
    } catch(e){
      print(e);
    }finally{
      await conn.close();
    }
  }

  static Future<MySqlConnection> obtenerConexion() async{
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _usuario,
      db:_nombreBBDD,
    );
    return await MySqlConnection.connect(settings);
  }

  static _crearBBDD(MySqlConnection conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS $_nombreBBDD');
    await conn.query('USE $_nombreBBDD');
    print('Conectado a $_nombreBBDD');
  }

  static _crearTablaUsuarios(MySqlConnection conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS usuarios (
    idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE, 
    password VARCHAR(10) NOT NULL,
    monedas INT DEFAULT 0
    )''' );
    print("Tabla usuarios creada");

  }

  static _crearTablaEquipo(MySqlConnection conn) async{
    await conn.query('''CREATE TABLE IF NOT EXISTS Equipo (
    id_equipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(20) NOT NULL UNIQUE,
    nombre_pokemon VARCHAR(20) NOT NULL, 
    vida INT NOT NULL
    )''');
    print("Tabla equipo creada"); 
  }



}