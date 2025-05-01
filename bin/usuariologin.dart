import 'database.dart';

class Usuario {
  String? _usuario;
  String? _password;
  String? _nombre; 
  String? _tipoPokemon;
  int _monedas = 0;

  String? get usuario => _usuario;
  String? get password => _password;
  String? get nombre => _nombre;
  String? get tipoPokemon => _tipoPokemon;
  int get monedas => _monedas;

  set usuario(String? usuario){
    _usuario = usuario;
  }
  set password(String? password){
    _password = password;
  }
  set nombre(String? nombre){
    _nombre = nombre;
  }
  set tipoPokemon(String? tipoPokemon){
    _tipoPokemon = tipoPokemon;
  }

  set monedas(int monedas){
    _monedas = monedas;
  }

static Future<bool> comprobarSiExiste(String nombre) async {
  bool existe =true;
  var conn;
  try{
    conn =await Database.obtenerConexion();
    var registros =
      await conn.query("SELECT * FROM usuarios WHERE nombre = ?", [nombre]);
      if(registros.length == 0){
        existe =false;
      }
  }catch(e){
    print(e);
  }finally{
    conn.close();
  }
  return existe;
}

Future<bool> save() async {
  bool guardado = false;
  var conn;
  try{
    conn =await Database.obtenerConexion();
    await conn.query("INSERT INTO usuarios (nombre, password) VALUES(?,?)", 
      [usuario, password]);
      guardado = true;
  }catch(e){
    print(e);
  }finally{
    conn.close();
  }
  return guardado;
}

Future<int> obtenerMonedas() async{
  var conn;
  try {
    conn = await Database.obtenerConexion();
    var resultados = await conn.query(
      "SELECT monedas FROM usuarios WHERE nombre = ?",
      [usuario]
    );

    if(resultados.isEmpty) return 0;
    return resultados.first[0] as int;

  }catch(e){
    print("Error obteniendo monedas: $e");
    return 0;
  }finally{
    await conn?.close();
  }
}

Future<bool> actualizarMonedas() async {
  var conn;
  try{
    conn = await Database.obtenerConexion();
    await conn.query(
      "UPDATE usuarios SET monedas = ? WHERE nombre = ?",
      [monedas,usuario]
    );
    return true;
  }catch(e){
    print("Error al actualizar monedas: $e");
    return false; 
  }finally{
    await conn?.close();
  }
}
   
}