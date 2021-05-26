import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Donneur {
  String id;
  List<String> maladie ;
  Map<String,dynamic> position ;
  String prenom ;
  String nom ;
  String phoneNumber ;
  String cin ;
  String type_sanguin ;
  int status ;
  String adresse ;
  String region ;

  Map<String,dynamic> get map {
    return {
      "id": id,
      "cin": cin,
      "maladie": maladie,
      "nom": nom,
      "phoneNumber": phoneNumber,
      "position": position,
      "adresse":adresse,
      "prenom": prenom,
      "region": region,
      "status": status,
      "type_sanguin": type_sanguin,
    };
  }
  String get Id {
    return id;
  }
  String get Cin {
    return cin;
  }
  List<String> get Maladie {
    return maladie;
  }
  String get PhoneNumber {
    return phoneNumber;
  }
  Map<String,dynamic> get Position {
    return position;
  }
  String get Prenom {
    return prenom;
  }
  String get Nom {
    return nom;
  }
  int get Status {
    return status;
  }
  String get Type_sanguin {
    return type_sanguin;
  }
  String get Region {
    return region;
  }
  String get Adresse {
    return adresse;
  }
  set Id(String id) {
    this.id = id;
  }
  set Cin(String cin) {
    this.cin = cin;
  }
  set Maladie(List<String> maladie) {
    this.maladie = maladie;
  }
  set PhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
  set Position(Map<String,dynamic> position) {
    this.position = position;
  }
  set Prenom(String prenom) {
    this.prenom = prenom;
  }
  set Nom(String nom) {
    this.nom = nom;
  }
  set Status(int status) {
    this.status = status;
  }
  set Adresse(String adresse) {
    this.adresse = adresse;
  }
  set Region(String region) {
    this.region = region;
  }
  set Type_sanguin(String type_sanguin) {
    this.type_sanguin = type_sanguin;
  }
  factory Donneur.fromJson(Map<String, dynamic> json) {
    List<String> mal=(jsonDecode(json['maladie'])as List<dynamic>).cast<String>();
    return Donneur(json['id'] as String,json['cin'] as String,mal,json['nom'] as String,json['phoneNumber']as String,json['position']as Map<String,dynamic>,json['adresse']as String,json['prenom']as String,json['region']as String,json['status']as int,json['type_sanguin']as String);
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "cin": cin,
    "maladie": maladie,
    "nom": nom,
    "phoneNumber": phoneNumber,
    "position": position,
    "adresse":adresse,
    "prenom": prenom,
    "region": region,
    "status": status,
    "type_sanguin": type_sanguin,
  };
  Donneur(this.id,this.cin,this.maladie,this.nom,this.phoneNumber,this.position,this.adresse,this.prenom,this.region,this.status,this.type_sanguin);
}