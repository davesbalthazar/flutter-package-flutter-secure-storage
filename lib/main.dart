import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  FlutterSecureStorage securityPrefs = await FlutterSecureStorage();

  // Gravação de dados usando FlutterSecureStorage de forma segura
  await securityPrefs.write(key: 'name', value: 'João');
  await securityPrefs.write(key: 'years_old', value: '100');
  await securityPrefs.write(key: 'logged', value: 'true');
  await securityPrefs.write(
      key: 'list', value: jsonEncode(['Maça', 'Banana', 'Uva']));

  // Remoção de dados
  // await securityPrefs.delete(key: 'years_old');
  // await securityPrefs.deleteAll();

  // Obtenção dos dados gravados criptografados
  var name = await securityPrefs.read(key: 'name');
  print(name);
  print(await securityPrefs.read(key: 'years_old'));
  print(await securityPrefs.read(key: 'logged'));
  print(await securityPrefs.read(key: 'list'));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Client {
  Client({
    required this.name,
    required this.phone,
  });

  String name;
  String phone;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory Client.fromJson(Map<String, dynamic> map) {
    return Client(
      name: map['name'],
      phone: map['phone'],
    );
  }
}
