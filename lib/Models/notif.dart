import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Notif {
  String donation;
  String contact ;
  String adresse ;
  int time ;
  int deadline;

  Map<String,dynamic> get map {
    return {
      "donation": donation,
      "contact": contact,
      "adresse":adresse,
      "time": time,
      "deadline": deadline,
    };
  }
  String get dona {
    return donation;
  }
  String get cont {
    return contact;
  }
  String get adr {
    return adresse;
  }
  int get tim {
    return time;
  }
  int get dead {
    return deadline;
  }

  set dona(String donation) {
    this.donation = donation;
  }
  set cont(String contact) {
    this.contact = contact;
  }
  set adr(String adresse) {
    this.adresse = adresse;
  }
  set tim(int time) {
    this.time = time;
  }
  set dead(int deadline) {
    this.deadline = deadline;
  }
  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(json['donation'] as String,json['contact'] as String,json['adresse'] as String,json['time'] as int,json['deadline']as int);
  }
  Map<String, dynamic> toJson() => {
    'donation': donation,
    'contact': contact,
    'adresse': adresse,
    'time': time,
    'deadline': deadline,
  };
  Notif(this.donation,this.contact,this.adresse,this.time,this.deadline);
}