
import 'database.dart';
import 'menus.dart';

void main () async {
  await Database.instalarBBDD();
  await Menus.menu();
}
