
import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(){
   return getDatabasesPath().then((dbPath) {
     final String path = join(dbPath, 'bytebank.db');

     return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER');
     }, version: 1);
   });
}

void save(Contact contact){
  createDatabase().then((db){
     
  });

}