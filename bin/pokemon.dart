
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  String nombre;
  List<String> tipos;
  List<String> habilidades;
  int vida;


Pokemon({required this.nombre, 
required this.tipos, 
required this.habilidades, 
required this.vida,});

factory Pokemon.fromAPI(Map<String, dynamic> datos){
  List<String> tipos = [];
  for(var tipo in datos["types"]){
    tipos.add(tipo["type"]["name"]);
  }

  List<String> habilidades =[];
  for (var hab in datos["abilities"]){
  habilidades.add(hab["ability"]["name"]);
  }
   
  int vida = 0;
  for(var stat in datos["stats"]){
    if(stat["stat"]["name"] == "hp"){
    vida = stat["base_stat"];
    break;
  }
  }
  
  return Pokemon(
    nombre: datos["name"],
    tipos: tipos,
    habilidades: habilidades,
    vida: vida,
  );
  }
  }
  
  

Future<Pokemon?> obtenerPokemon(String nombre) async{
  final url = Uri.parse("https://pokeapi.co/api/v2/pokemon/$nombre");
  
  try{
    final respuesta = await http.get(url);

    if(respuesta.statusCode == 200){
      final datos = json.decode(respuesta.body);
      return Pokemon.fromAPI(datos);

    }else if(respuesta.statusCode == 404){
      throw("El pokemon que buscas no existe!");
    }else throw ("Ha habido un error de conexión");
  }catch (e){
    print("Error: $e");
  }
  return null; 
}
